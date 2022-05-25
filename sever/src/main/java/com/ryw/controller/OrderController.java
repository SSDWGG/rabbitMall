package com.ryw.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ryw.entity.User;
import com.ryw.entity.Userorder;
import com.ryw.mapper.UserinfoMapper;
import com.ryw.mapper.UserorderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
public class OrderController {

    @Autowired
    UserorderMapper userorderMapper;

    @CrossOrigin
    @RequestMapping("/allorder")              // 分页查询  和全部数据条数
    public String  allorder(@RequestParam("pageNum") int pageNum  ,
                              @RequestParam("pageSize") int pageSize ){   //接收传来的参数，这里了封装一个实体类

        Page<Userorder> page = new Page<>(pageNum,pageSize);
        userorderMapper.selectPage(page, null);
        List<Userorder> userorders  = page.getRecords();  //分页查询出的用户数据
        HashMap<String, Object> res = new HashMap<>();
        long numbers = page.getTotal();// 总条数
        res.put("numbers",numbers);
        res.put("data",userorders);
        String json = JSON.toJSONString(res);
        return json;
    }

    @RequestMapping("/sendbyorderid")
    public String  sendbyorderid(@RequestParam("orderid") Long orderid){

        Userorder userorder = userorderMapper.selectById(orderid);
        userorder.setIssend(1);
        int count = userorderMapper.updateById(userorder);
        String str;
        if(count>0)str ="success";
        else str = "false";
        return str;

    }

    @RequestMapping("/deleteorder")
    public String  deleteorder(@RequestParam("orderid") Long orderid){
        int i = userorderMapper.deleteById(orderid);
        String str;
        if(i>0)str ="success";
        else str = "false";
        return str;
    }

    @RequestMapping("/queryorder")
    public List<Userorder>  queryorder(@RequestParam("username") String username){
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.like(username!=null,"username",username);
        List<Userorder> orderlist = userorderMapper.selectList(queryWrapper);
        return orderlist ;
    }
}
