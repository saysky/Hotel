package com.example.hotel.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.hotel.common.base.BaseEntity;
import lombok.Data;

import java.util.List;

/**
 * @author example
 */
@Data
@TableName("role")
public class Role  extends BaseEntity {

    /**
     * 角色名称：admin，author，subscriber
     */
    private String role;

    /**
     * 描述：管理员，作者，订阅者
     */
    private String description;

    /**
     * 级别
     */
    private Integer level;

    /**
     * 用户注册默认角色
     */
    private Integer isRegisterDefault;

    /**
     * 该角色对应的用户数量，非数据库字段
     */
    @TableField(exist = false)
    private Integer count;

    /**
     * 当前角色的权限列表
     */
    @TableField(exist = false)
    private List<Permission> permissions;

}