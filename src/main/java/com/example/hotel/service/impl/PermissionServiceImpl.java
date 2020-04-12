package com.example.hotel.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.hotel.entity.Permission;
import com.example.hotel.mapper.PermissionMapper;
import com.example.hotel.mapper.RolePermissionRefMapper;
import com.example.hotel.service.PermissionService;
import com.example.hotel.util.PermissionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 角色业务逻辑实现类
 */
@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Autowired
    private RolePermissionRefMapper rolePermissionRefMapper;


    @Override
    public List<Permission> listPermissionsByRoleId(Long roleId) {
        return permissionMapper.findByRoleId(roleId);
    }

    @Override
    public Set<String> findPermissionUrlsByUserId(Long userId) {
        List<Permission> permissions = permissionMapper.findPermissionByUserId(userId);
        Set<String> urls = permissions.stream().map(p -> p.getUrl()).collect(Collectors.toSet());
        return urls;
    }

    @Override
    public List<Permission> findPermissionTreeByUserIdAndResourceType(Long userId, String resourceType) {
        List<Permission> permissions = permissionMapper.findPermissionByUserIdAndResourceType(userId, resourceType);
        return PermissionUtil.getPermissionTree(permissions);
    }

    @Override
    public List<Permission> findPermissionByRoleId(Long roleId) {
        return permissionMapper.findPermissionByRoleId(roleId);
    }


    @Override
    public BaseMapper<Permission> getRepository() {
        return permissionMapper;
    }

    @Override
    public QueryWrapper<Permission> getQueryWrapper(Permission permission) {
        //对指定字段查询
        QueryWrapper<Permission> queryWrapper = new QueryWrapper<>();
        if (permission != null) {
            if (StrUtil.isNotBlank(permission.getResourceType())) {
                queryWrapper.eq("resource_type", permission.getResourceType());
            }
            if (StrUtil.isNotBlank(permission.getResourceType())) {
                queryWrapper.eq("resource_type", permission.getResourceType());
            }
            if (StrUtil.isNotBlank(permission.getUrl())) {
                queryWrapper.eq("url", permission.getUrl());
            }
            if (StrUtil.isNotBlank(permission.getName())) {
                queryWrapper.eq("name", permission.getName());
            }
        }
        return queryWrapper;
    }

    @Override
    public Permission insertOrUpdate(Permission entity) {
        if (entity.getId() == null) {
            insert(entity);
        } else {
            update(entity);
        }
        return entity;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id) {
        permissionMapper.deleteById(id);
        rolePermissionRefMapper.deleteByPermissionId(id);
    }

    @Override
    public List<Permission> findPermissionListWithLevel() {
        List<Permission> permissionList = permissionMapper.selectList(null);
        permissionList = PermissionUtil.getPermissionList(permissionList);

        // 加空格以展示等级
        for (Permission permission : permissionList) {
            for (int i = 1; i < permission.getLevel(); i++) {
                permission.setName("&nbsp;&nbsp;&nbsp;&nbsp;"+permission.getName());
            }
        }
        return permissionList;

    }

    @Override
    public Integer countChildPermission(Long id) {
        return permissionMapper.countChildPermission(id);
    }

    @Override
    public Permission findByUrl(String url) {
        return permissionMapper.findByUrl(url);
    }

}
