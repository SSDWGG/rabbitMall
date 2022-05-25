package com.ryw.hander;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
//import com.oracle.tools.packager.Log;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;


@Slf4j                  //打印日志
@Component          //把组件加入ioc容器，可以调用
public class MyMateObjectHander implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
//        Log.info("star insert fill");
        this.setFieldValByName("createTime",new Date(),metaObject);
        this.setFieldValByName("updateTime",new Date(),metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
//        Log.info("star update fill");
        this.setFieldValByName("updateTime",new Date(),metaObject);
    }
}
