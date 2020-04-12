package com.example.hotel.service;

import com.example.hotel.entity.UserRoleRef;
import com.example.hotel.common.base.BaseService;


public interface UserRoleRefService extends BaseService<UserRoleRef, Long> {

    /**
     * 根据用户Id删除
     *
     * @param userId 用户Id
     */
    void deleteByUserId(Long userId);


}
