package com.ryw.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ryw.entity.User;
import org.springframework.stereotype.Repository;


@Repository
public interface UserMapper extends BaseMapper<User> {
    int changedeleteByid(Long id, int deleted);
    int deepDeleteByid(Long id);
}
