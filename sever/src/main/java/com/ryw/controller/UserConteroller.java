package com.ryw.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ryw.entity.Goods;
import com.ryw.entity.User;
import com.ryw.entity.Userinfo;
import com.ryw.mapper.GoodsMapper;
import com.ryw.mapper.UserMapper;
import com.ryw.mapper.UserinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Wrapper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@RestController
public class UserConteroller {

    @Autowired
    UserMapper userMapper;
    @Autowired
    UserinfoMapper userinfoMapper;
    @Autowired
    GoodsMapper goodsMapper;

    @CrossOrigin
    @RequestMapping("/allUser")              // 分页查询  和全部数据条数
    public String getUserList(@RequestParam("pageNum") int pageNum  ,
                              @RequestParam("pageSize") int pageSize ){   //接收传来的参数，这里了封装一个实体类

        Page<User> page = new Page<>(pageNum,pageSize);
        userMapper.selectPage(page, null);
        List<User> users  = page.getRecords();  //分页查询出的用户数据
        HashMap<String, Object> res = new HashMap<>();
        long numbers = page.getTotal();// 总条数
        res.put("numbers",numbers);
        res.put("data",users);
//        System.out.println("总条数："+numbers);
        String users_json = JSON.toJSONString(res);
        return users_json;
    }

    @RequestMapping("/addUser")         //管理员直接添加用户
    public String addUser(@RequestParam("username") String username,
                          @RequestParam("password") String password,
                          @RequestParam("email") String email,
                          User user){
        //姓名邮箱都不得重复
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username",username).or().eq("email",email);
        User usertarge = userMapper.selectOne(wrapper);//字段无重复，可以添加注册用户
        if (usertarge == null) {
            //用户名不重复，放入数据库
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            int result = userMapper.insert(user);
            if(result!=0){

                /*拿到注册的id*/
                QueryWrapper<User> wrapper2 = new QueryWrapper<>();
                wrapper2.eq("email",email);
                User usertarge2 = userMapper.selectOne(wrapper2);
                Long id = usertarge2.getId();
                /*自动生成usrinfo信息*/
                setuserinfo(id);

                return "insertsuccess";     //插入成功   代码  insertsuccess
            }
            return   "0";           //插入操作失败    代码0
        }
        return "00" ;                 //用户名或者邮箱重复  代码00
    }


    @RequestMapping("/attributechange")         //切换属性
    public String updateUserState(@RequestParam("id") Long  id,
                                  @RequestParam("name") String name,
                                  @RequestParam("targe") Boolean targe){
       int count = 0;
        User user = userMapper.selectById(id);
        if(name.equals("admin")){                     //做不同属性名的判断
                    int targeadmin = targe?1:0;          //布尔值转数字01
                    user.setAdmin(targeadmin);
                    count =  userMapper.updateById(user);
        }else if(name.equals("deleted")){            //不能只是删除，还要取反的
                    int targedeleted = targe?1:0;
                   count =  userMapper.changedeleteByid(id,targedeleted);
        }else if(name.equals("goodsdeleted")){           //商品的上下架
            int targedeleted = targe?1:0;
            count =  goodsMapper.issell(id,targedeleted);
        }
        String str = count >0?"success":"error";
        return str;
    }


    @RequestMapping("/dimquery")       //根据username模糊查询
    public String dimquery(@RequestParam("queryinfo") String  queryinfo){
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.like(queryinfo!=null,"username",queryinfo);
        List<User> userlist = userMapper.selectList(queryWrapper);          //对user表的username模糊查询

        ArrayList<Userinfo> arrayList = new ArrayList<>();
        for(int i =0;i<userlist.size();i++){
            //筛选出填写了userinfo的用户
        QueryWrapper queryWrapperone = new QueryWrapper();
        queryWrapperone.eq("id",userlist.get(i).getId());

        Userinfo userinfo = userinfoMapper.selectOne(queryWrapperone);
           if(userinfo!=null){
                if(userinfo.getAdress()!=null){
                    userinfo.setUsername(userlist.get(i).getUsername());
                    arrayList.add(userinfo);        //把符合条件的放入最后传送的数组
                }
           }

        }
        HashMap<String, Object> res = new HashMap<>();
        res.put("data",userlist);
        res.put("datauserinfo",arrayList);
        String users_json = JSON.toJSONString(res);
        return users_json;

    }


    @RequestMapping("/editUser")            //修改用户基础信息
    public String editUser(@RequestParam("id") Long id,
                           @RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("email") String email,
                           User user){

        user = userMapper.selectById(id);           //拿到数据库中的原数据
        String Yusername = user.getUsername();
        String Yemail = user.getEmail();

        //用户名邮箱和数据库中的不能有重复（除自己的原本的数据）
        QueryWrapper<User> wrapper = new QueryWrapper<>();

        wrapper.and(i->i.eq("username",username).or().eq("email",email))
                .and(i->i.ne("username", Yusername).or().ne("email", Yemail))

        ;
        User usertarge = userMapper.selectOne(wrapper);  //符合条件可以修改用户
        if (usertarge == null) {
            //用户名不重复，执行修改

            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            int result =  userMapper.updateById(user);

            if(result!=0){
                return "updatesuccess";     //插入成功   代码  updatesuccess
            }
            return   "0";           //更新操作失败    代码0
        }
        return "00" ;                 //用户名或者邮箱重复  代码00
    }

    @RequestMapping("/deleteUser")        //管理员深度删除用户(可以改成非深度删除)
    public String deleteUser(@RequestParam("id") Long id){
        //       userMapper.deepDeleteByid(id);
        userMapper.deleteById(id);

        //        init userinfo
        setuserinfo(id);

        QueryWrapper<Userinfo> wrapper = new QueryWrapper<>();
        wrapper.eq("id",id);
       userinfoMapper.delete(wrapper);//逻辑删除
        return "success";
    }


    // 自动生成userinfo内容   参数id
    public void setuserinfo(@RequestParam Long id)
    {
        Userinfo userinfo = new Userinfo();
        userinfo.setId(id);
        userinfo.setAdress("insert your adress");
        userinfo.setTximg("/tximg/inittximg.jpg");
        userinfo.setAge(18);
        QueryWrapper<Userinfo> wrapper = new QueryWrapper<>();
        wrapper.eq("id",id);
        int count  = userinfoMapper.update(userinfo,wrapper);
        if(count==0){
                // 无用户，进行创建一个初始化的userinfo
            userinfoMapper.insert(userinfo);
        }
    }

}
