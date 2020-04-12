package com.example.hotel.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.hotel.entity.Permission;
import com.example.hotel.entity.Role;
import com.example.hotel.entity.RolePermissionRef;
import com.example.hotel.mapper.RoleMapper;
import com.example.hotel.service.RolePermissionRefService;
import com.example.hotel.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 角色业务逻辑实现类
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RolePermissionRefService rolePermissionRefService;

    @Override
    public BaseMapper<Role> getRepository() {
        return roleMapper;
    }

    @Override
    public QueryWrapper<Role> getQueryWrapper(Role role) {
        //对指定字段查询
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        if (role != null) {
            if (StrUtil.isNotBlank(role.getRole())) {
                queryWrapper.eq("role", role.getRole());
            }
            if (StrUtil.isNotBlank(role.getDescription())) {
                queryWrapper.eq("description", role.getDescription());
            }
        }
        return queryWrapper;
    }

    @Override
    public void deleteByUserId(Long userId) {
        roleMapper.deleteByUserId(userId);
    }

    @Override
    public Role findByRoleId(Long roleId) {
        return roleMapper.selectById(roleId);
    }

    @Override
    public Role findByRoleName(String roleName) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("role", roleName);
        return roleMapper.selectOne(queryWrapper);
    }

    @Override
    public Role findByUserId(Long userId) {
        return roleMapper.findByUserId(userId);
    }

    @Override
    public Integer countUserByRoleId(Long roleId) {
        return roleMapper.countUserByRoleId(roleId);
    }

    @Override
    public Integer findMaxLevelByUserId(Long userId) {
        return roleMapper.findMaxLevelByUserId(userId);
    }

    @Override
    public List<Role> findByLessThanLevel(Integer level) {
        return roleMapper.findByLessThanLevel(level);
    }

    @Override
    public Role findDefaultRole() {
        return roleMapper.findDefaultRole();
    }

    @Override
    public Role getMaxRoleByUserId(Long userId) {
        return null;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Role insert(Role role) {
        roleMapper.insert(role);
        if (role.getPermissions() != null && role.getPermissions().size() > 0) {
            List<RolePermissionRef> rolePermissionRefs = new ArrayList<>(role.getPermissions().size());
            for (Permission permission : role.getPermissions()) {
                rolePermissionRefs.add(new RolePermissionRef(role.getId(), permission.getId()));
            }
            rolePermissionRefService.batchSaveByRolePermissionRef(rolePermissionRefs);
        }
        return role;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Role update(Role role) {
        roleMapper.updateById(role);
        if (role.getPermissions() != null && role.getPermissions().size() > 0) {
            // 删除关联
            rolePermissionRefService.deleteRefByRoleId(role.getId());
            // 添加关联
            List<RolePermissionRef> rolePermissionRefs = new ArrayList<>(role.getPermissions().size());
            for (Permission permission : role.getPermissions()) {
                rolePermissionRefs.add(new RolePermissionRef(role.getId(), permission.getId()));
            }
            rolePermissionRefService.batchSaveByRolePermissionRef(rolePermissionRefs);
        }
        return role;
    }

    @Override
    public Role insertOrUpdate(Role entity) {
        if (entity.getId() == null) {
            insert(entity);
        } else {
            update(entity);
        }
        return entity;
    }

}
