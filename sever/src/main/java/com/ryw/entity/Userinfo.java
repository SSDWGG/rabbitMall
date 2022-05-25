package com.ryw.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.ToStringSerializer;
import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Userinfo {
    @JSONField(serializeUsing= ToStringSerializer.class)
    @TableId(type = IdType.ID_WORKER)
    private Long userinfoid;

    @JSONField(serializeUsing= ToStringSerializer.class)
    private Long id;

    private String tximg;
    private String adress;
    private int age;
    private double vipmoney;
    private String rate;

    @TableField(exist = false)              //sql查询的时候不放在条件中
    private String username;

    @TableLogic
    private Integer deleted;
    @Version
    private  Integer version;
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;


    //构造类和setget方法 和tostring方法


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTximg() {
        return tximg;
    }

    public void setTximg(String tximg) {
        this.tximg = tximg;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getVipmoney() {
        return vipmoney;
    }

    public void setVipmoney(double vipmoney) {
        this.vipmoney = vipmoney;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }
}
