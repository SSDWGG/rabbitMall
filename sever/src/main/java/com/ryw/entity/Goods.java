package com.ryw.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.ToStringSerializer;
import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {

    @TableId(type = IdType.ID_WORKER)
    @JSONField(serializeUsing= ToStringSerializer.class)
    private Long goodsid;

    private String goodsname;
    private String category;
    private String goodstitle;
    private String goodsdescribe;

    private double price;
    private double nowprice;

    private int sellcount;

    @TableField(exist = false)              //sql查询的时候不放在条件中
    private List<Goodsimg> imglist;
    @TableField(exist = false)              //sql查询的时候不放在条件中
    private List<Sizerestcount> sizecountlist ;

    @TableLogic //逻辑删除注解    (内部进行更新)
    private Integer deleted;

    @TableField(fill = FieldFill.INSERT)        //内容自动填充（插入时自动填充时间）
    private Date createTime;
    @TableField(fill = FieldFill.INSERT_UPDATE)//内容自动填充（修改时自动填充时间）
    private Date updateTime;

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getGoodstitle() {
        return goodstitle;
    }

    public void setGoodstitle(String goodstitle) {
        this.goodstitle = goodstitle;
    }

    public String getGoodsdescribe() {
        return goodsdescribe;
    }

    public void setGoodsdescribe(String goodsdescribe) {
        this.goodsdescribe = goodsdescribe;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getNowprice() {
        return nowprice;
    }

    public void setNowprice(double nowprice) {
        this.nowprice = nowprice;
    }

    public int getSellcount() {
        return sellcount;
    }

    public void setSellcount(int sellcount) {
        this.sellcount = sellcount;
    }

    public List<Goodsimg> getImglist() {
        return imglist;
    }

    public void setImglist(List<Goodsimg> imglist) {
        this.imglist = imglist;
    }

    public List<Sizerestcount> getSizecountlist() {
        return sizecountlist;
    }

    public void setSizecountlist(List<Sizerestcount> sizecountlist) {
        this.sizecountlist = sizecountlist;
    }
}
