package com.ryw.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.ToStringSerializer;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Sizerestcount {
    @TableId(type = IdType.ID_WORKER)
    @JSONField(serializeUsing= ToStringSerializer.class)
    private Long sizetableid;

    @JSONField(serializeUsing= ToStringSerializer.class)
    private Long goodsid;

    private String size;
    private int restcount;

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getRestcount() {
        return restcount;
    }

    public void setRestcount(int restcount) {
        this.restcount = restcount;
    }

    public Long getSizetableid() {
        return sizetableid;
    }

    public void setSizetableid(Long sizetableid) {
        this.sizetableid = sizetableid;
    }

    public Long getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Long goodsid) {
        this.goodsid = goodsid;
    }
}
