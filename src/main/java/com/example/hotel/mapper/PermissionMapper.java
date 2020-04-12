package com.example.hotel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.hotel.entity.Permission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author example
 */
@Mapper
public interface PermissionMapper extends BaseMapper<Permission> {

    /**
     * 根据角色Id获得权限列表
     *
     * @param roleId 角色Id
     * @return 权限列表
     */
    List<Permission> findByRoleId(Long roleId);

    /**
     * 获得某个用户的权限列表
     *
     * @param userId
     * @return
     */
    List<Permission> findPermissionByUserId(Long userId);

    /**
     * 获得某个用户的权限列表
     *
     * @param userId
     * @param resourceType
     * @return
     */
    List<Permission> findPermissionByUserIdAndResourceType(@Param("userId") Long userId,
                                                           @Param("resourceType") String resourceType);


    /**
     * 获得权限列表
     *
     * @param resourceType
     * @return
     */
    List<Permission> findPermissionByResourceType(Integer resourceType);

    /**
     * 根据角色ID获得权限列表
     * @param roleId
     * @return
     */
    List<Permission> findPermissionByRoleId(Long roleId);

    /**
     * 统计子节点数量
     * @param id
     * @return
     */
    Integer countChildPermission(Long id);

    /**
     * 根据URL获得权限
     * @param url
     * @return
     */
    Permission findByUrl(String url);
}

