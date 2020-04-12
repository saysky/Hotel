package com.example.hotel.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.hotel.common.base.BaseService;
import com.example.hotel.dto.PostQueryCondition;
import com.example.hotel.entity.Post;

/**
 * <pre>
 *     记录/页面业务逻辑接口
 * </pre>
 */
public interface PostService extends BaseService<Post, Long> {

    /**
     * 根据条件获得列表
     * @param condition
     * @return
     */
    Page<Post> findPostByCondition(PostQueryCondition condition, Page<Post> page);



}
