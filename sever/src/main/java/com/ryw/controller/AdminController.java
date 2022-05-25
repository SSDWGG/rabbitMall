package com.ryw.controller;

import com.alibaba.fastjson.JSON;
import com.ryw.entity.Adminactive;
import com.ryw.mapper.AdminactiveMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class AdminController {
    @Autowired
    private AdminactiveMapper adminactiveMapper ;

    @CrossOrigin
    @RequestMapping("/getadminloglist")       //查看adminloglist
    public String getadminloglist()
    {
        List<Adminactive> adminactives = adminactiveMapper.selectList(null);
        String json = JSON.toJSONString(adminactives);
        return json;
    }

    @RequestMapping("/setadminlog")       //记录管理员行为
    public String setadminlog(@RequestParam("adminname") String adminname,
                              @RequestParam("adminactive") String adminactive,
                              Adminactive aa)
    {
        aa.setAdminname(adminname);
        aa.setAdminactive(adminactive);
        adminactiveMapper.insert(aa);
        return "success";
    }

}
