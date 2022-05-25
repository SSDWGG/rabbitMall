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
public class Userorder {
    @JSONField(serializeUsing= ToStringSerializer.class)
    @TableId(type = IdType.ID_WORKER)
    private Long orderid;

    @JSONField(serializeUsing= ToStringSerializer.class)
    private Long id;

    private String goodsimg;
    private String adress;
    private String username;
    private String email;
    private double goodsprice;
    private String size;
    private String goodstitle;
    private Integer issend;

    @TableLogic //逻辑删除注解    (内部进行更新)
    private Integer deleted;

    @Version    //乐观锁注解
    private  Integer version;

    @TableField(fill = FieldFill.INSERT)        //内容自动填充（插入时自动填充时间）
    private Date createTime;
    @TableField(fill = FieldFill.INSERT_UPDATE)//内容自动填充（修改时自动填充时间）
    private Date updateTime;

//    提那家set get方法  和构造类和  tostring

    public String getGoodstitle() {
        return goodstitle;
    }

    public void setGoodstitle(String goodstitle) {
        this.goodstitle = goodstitle;
    }

    public Long getOrderid() {
        return orderid;
    }

    public void setOrderid(Long orderid) {
        this.orderid = orderid;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGoodsimg() {
        return goodsimg;
    }

    public void setGoodsimg(String goodsimg) {
        this.goodsimg = goodsimg;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(double goodsprice) {
        this.goodsprice = goodsprice;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "Userorder{" +
                "orderid=" + orderid +
                ", id=" + id +
                ", goodsimg='" + goodsimg + '\'' +
                ", adress='" + adress + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", goodsprice=" + goodsprice +
                ", size='" + size + '\'' +
                ", deleted=" + deleted +
                ", version=" + version +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
