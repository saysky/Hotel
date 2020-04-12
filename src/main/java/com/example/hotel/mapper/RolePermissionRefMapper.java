package com.example.hotel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.hotel.entity.RolePermissionRef;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


/**
 * @author example
 */
@Mapper
public interface RolePermissionRefMapper extends BaseMapper<RolePermissionRef> {


    /**
     * 根据角色Id删除
     *
     * @param roleId 角色Id
     * @return 影响行数
     */
   Integer deleteByRoleId(Long roleId);

    /**
     * 根据权限Id删除
     *
     * @param permissionId 权限Id
     * @return 影响行数
     */
    Integer deleteByPermissionId(Long permissionId);
    /**
     * 批量添加
     *
     * @param rolePermissionRefList 列表
     * @return 影响喊你高数
     */
   Integer batchInsert(List<RolePermissionRef> rolePermissionRefList);
}

