package com.example.hotel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.hotel.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author example
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    /**
     * 根据角色Id获得用户
     *
     * @param roleId 角色Id
     * @param page 分页信息
     * @return 用户列表
     */
    List<User> findByRoleId(@Param("roleId") Long roleId, Page page);

    /**
     * 根据角色Id和条件获得用户
     *
     * @param roleId 角色Id
     * @param user 条件
     * @param page 分页信息
     * @return 用户列表
     */
    List<User> findByRoleIdAndCondition(@Param("roleId") Long roleId,
                                        @Param("user") User user, Page page);

    /**
     * 根据条件查询
     *
     * @param user 用户
     * @param page 分页
     * @return 用户列表
     */
    List<User> findByCondition( @Param("user") User user, Page page);

    /**
     * 获得今日新增数量
     * @return
     */
    Integer getTodayCount();

    /**
     * 获得用户客房数排名
     * @param limit 查询数量
     * @return
     */
    List<User> getUserPostRanking(Integer limit);

    /**
     * 获得最新注册用户
     * @param limit
     * @return
     */
    List<User> getLatestUser(Integer limit);

    /**
     * 获得热门用户
     * @param limit 用户数量
     * @return
     */
    List<User> getHotUsers(Integer limit);

}

