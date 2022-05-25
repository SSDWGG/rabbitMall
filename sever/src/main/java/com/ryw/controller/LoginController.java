package com.ryw.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.ToStringSerializer;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ryw.entity.User;
import com.ryw.entity.Userinfo;
import com.ryw.entity.Userorder;
import com.ryw.mapper.UserMapper;
import com.ryw.mapper.UserinfoMapper;
import com.ryw.mapper.UserorderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController                             //返回值字符
public class LoginController {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserinfoMapper userinfoMapper;
    @Autowired
    private UserorderMapper userorderMapper;

    @CrossOrigin            //所有方法跨域
    @RequestMapping("/login")           //用户和管理员登录
    public String userLogin(@RequestParam("username") String username,
                            @RequestParam("password") String password)
    {  //接收传来的参数，参数是user对象 参数格式要一致
        String str = "error";
        HashMap<String, Object> map = new HashMap<>(); // 自定义要查的条件
        map.put("username",username);
        map.put("password",password);
        List<User> users = userMapper.selectByMap(map);
        if (!users.isEmpty()) {
            str = "normaluser";             //设置为普通用户

            if(users.get(0).getAdmin()==1){    //判断是否是管理员 （管理员的username不能重复），用户email不能重复
                str = "admin";
            }
        }
//        System.out.println(str);
        return str;
    }

    @RequestMapping("/getuserallinfo")           //获取用户所有信息
    public String userLogin(@RequestParam("username") String username,
                            User user, Userinfo userinfo)
    {
        QueryWrapper<User> wrapperuser = new QueryWrapper<>();
        wrapperuser.eq("username",username);
        user = userMapper.selectOne(wrapperuser);
//        System.out.println("============================"+user);
        QueryWrapper<Userinfo> wrapperuserinfo = new QueryWrapper<>();
        wrapperuserinfo.eq("id",user.getId());
        userinfo = userinfoMapper.selectOne(wrapperuserinfo);

        QueryWrapper<Userorder> wrapperuserorder = new QueryWrapper<>();
        wrapperuserorder.eq("id",user.getId());
        List<Userorder> userorderlist = new ArrayList<>();
        userorderlist = userorderMapper.selectList(wrapperuserorder);

        HashMap<String, Object> map = new HashMap<>();
//        System.out.println(user.getId().toString());
        map.put("id",user.getId().toString());
        map.put("username",user.getUsername());
        map.put("password",user.getPassword());
        map.put("email",user.getEmail());
        map.put("createTime",user.getCreateTime());
        map.put("userinfo",userinfo);
        map.put("orderlist",userorderlist);
        String userallinfo_json = JSON.toJSONString(map);
        return userallinfo_json;
    }







    @RequestMapping(value = "/testobj", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public String testobj(@RequestBody JSONObject jsonParam)
    {
//        System.out.println(jsonParam.toJSONString());
//        String username=jsonParam.get("username").toString();
//        System.out.println("username : " + username);
//        System.out.println("jsonParam : " + jsonParam);
        return "testobj success";
    }

    @RequestMapping("/testobj2")
    public String testobj2(@RequestParam("username") String username)
    {
//        System.out.println("username : " + username);
        return "testobj2 success";
    }

    @RequestMapping("/test")
    public String test()
    {
       return "test success";
    }


}
