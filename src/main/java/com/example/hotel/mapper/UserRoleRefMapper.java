package com.example.hotel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.hotel.entity.UserRoleRef;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author example
 */
@Mapper
public interface UserRoleRefMapper extends BaseMapper<UserRoleRef> {

    /**
     * 根据用户Id删除
     *
     * @param userId 用户Id
     * @return 影响行数
     */
    Integer deleteByUserId(Long userId);
}

