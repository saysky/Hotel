package com.example.hotel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.hotel.entity.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


/**
 * @author example
 */
@Mapper
public interface RoleMapper extends BaseMapper<Role> {


    /**
     * 根据用户Id获得角色
     *
     * @param userId 用户Id
     * @return 角色列表
     */
    Role findByUserId(Long userId);


    /**
     * 删除用户和角色管理
     *
     * @param userId 用户ID
     * @return 影响行数
     */
    Integer deleteByUserId(Long userId);

    /**
     * 统计某个角色的用户数
     *
     * @param roleId 角色Id
     * @return 用户数
     */
    Integer countUserByRoleId(Long roleId);


    /**
     * 获得所有角色和对应用户数量
     * @return
     */
    List<Role> findAllWithCount();

    /**
     * 查询小于等于该等级的角色
     * @param level
     * @return
     */
    List<Role> findByLessThanLevel(Integer level);

    /**
     * 查询某个用户最大的角色等级
     * @param userId
     * @return
     */
    Integer findMaxLevelByUserId(Long userId);

    /**
     * 获得用户注册默认角色
     * @return
     */
    Role findDefaultRole();
}

