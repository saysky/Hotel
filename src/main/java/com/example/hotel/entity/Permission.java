package com.example.hotel.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.hotel.common.base.BaseEntity;
import lombok.Data;

import java.util.List;


/**
 *
 * 权限，后台的菜单
 * @author example
 */
@Data
@TableName("permission")
public class Permission  extends BaseEntity {

    /**
     * 权限名称
     */
    private String name;

    /**
     * pid
     */
    private Long pid;

    /**
     * 资源类型
     */
    private String resourceType;

    /**
     * 请求URL
     */
    private String url;

    /**
     * 图标
     */
    private String icon;

    /**
     * 序号(越小越靠前)
     */
    private Double sort;

    /**
     * 级别
     */
    @TableField(exist = false)
    private Integer level;

    /**
     * 子权限列表
     */
    @TableField(exist = false)
    private List<Permission> childPermissions;

}