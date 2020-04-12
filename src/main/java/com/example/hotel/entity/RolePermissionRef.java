package com.example.hotel.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.hotel.common.base.BaseEntity;
import lombok.Data;

@Data
@TableName("role_permission_ref")
public class RolePermissionRef  extends BaseEntity {

    /**
     * 角色Id
     */
    private Long roleId;

    /**
     * 权限Id
     */
    private Long permissionId;

    public RolePermissionRef() {
    }

    public RolePermissionRef(Long roleId, Long permissionId) {
        this.roleId = roleId;
        this.permissionId = permissionId;
    }
}