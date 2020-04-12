package com.example.hotel.service;

import com.example.hotel.entity.RolePermissionRef;

import java.util.List;


public interface RolePermissionRefService {

    /**
     * 删除某个角色的所有关联
     *
     * @param roleId 角色Id
     */
    void deleteRefByRoleId(Long roleId);

    /**
     * 添加角色和权限关联
     *
     * @param rolePermissionRef RolePermissionRef
     * @return UserRoleRef
     */
    void saveByRolePermissionRef(RolePermissionRef rolePermissionRef);

    /**
     * 批量添加
     *
     * @param rolePermissionRefs 列表
     */
    void batchSaveByRolePermissionRef(List<RolePermissionRef> rolePermissionRefs);

}
