package com.ryw.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ryw.entity.Goods;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMapper extends BaseMapper<Goods> {
    int issell(Long goodsid, int deleted);
    List<Goods> getoutgoods();
}
