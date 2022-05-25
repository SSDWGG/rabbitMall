package com.ryw.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ryw.entity.Userinfo;
import com.ryw.mapper.UserMapper;
import com.ryw.mapper.UserinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@RestController
public class UserInfoController {
    @Autowired
    UserinfoMapper userinfoMapper;
    @Autowired
    UserMapper userMapper;

    @CrossOrigin
    @RequestMapping("/allUserinfo")              // 分页查询userinfo  和全部数据条数
    public String getUserList(@RequestParam("pageNum") int pageNum ,
                              @RequestParam("pageSize") int pageSize )
    {
        Page<Userinfo> page = new Page<>(pageNum,pageSize);
        List<Userinfo> userinfos = userinfoMapper.userinfoPagelistAnduser(page);//分页查询并且多表链接
        HashMap<String, Object> res = new HashMap<>();
        long numbers = page.getTotal();
        res.put("numbers",numbers);
        res.put("data",userinfos);
//        System.out.println("总条数："+numbers);
        String users_json = JSON.toJSONString(res);
        return users_json;
    }

    @RequestMapping("/editUserinfo")            //修改用户基础信息userinfo
    public String editUserinfo(@RequestParam("id") Long id,
                               @RequestParam("age") int age,
                               @RequestParam("adress") String adress,
                               Userinfo userinfo){
            QueryWrapper<Userinfo> wrapper = new QueryWrapper<>();
            wrapper.eq("id",id);
            userinfo = userinfoMapper.selectOne(wrapper);
            userinfo.setTximg("/tximg/inittximg.jpg");
            userinfo.setAdress(adress);
            userinfo.setAge(age);
            int result= userinfoMapper.updateById(userinfo);
            if(result!=0){
                return "updatesuccess";
            }
            return "error";
    }

    @RequestMapping("/uploadtximg")            //头像图片上传
    public String uploadtximg(@RequestParam("file") MultipartFile file,
                              String id){
        File path = new File("/home/www/dist/tximg"); //服务器地址
//        File path = new File("/Users/renshuaiweidemac/Desktop/毕设/YG_java/img");
        if(!path.exists()){
            path.mkdir();
        }
        File tofile = new File(path,id+"tximg.jpg"); //用id命名
        try {
            file.transferTo(tofile);
//           存入userinfo表中"/tximg/"+id+"tximg.jpg"
            QueryWrapper<Userinfo> wrapper = new QueryWrapper<>();
            wrapper.eq("id",id);
            Userinfo userinfo = userinfoMapper.selectOne(wrapper);
            userinfo.setTximg("/tximg/"+id+"tximg.jpg");
            int result= userinfoMapper.updateById(userinfo);
            if(result!=0){
                return "success";
            }
            return "false";
        }catch (IOException e){
            e.printStackTrace();
            return "false";
        }
    }

}
