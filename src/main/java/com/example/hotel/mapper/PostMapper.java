package com.example.hotel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.hotel.dto.PostQueryCondition;
import com.example.hotel.entity.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author liuyanzhao
 */
@Mapper
public interface PostMapper extends BaseMapper<Post> {

    /**
     * 根据标签ID查询客房
     *
     * @param condition
     * @param page
     * @return
     */
    List<Post> findPostByCondition(@Param("condition") PostQueryCondition condition, Page page);

    /**
     * 统计该分类的客房
     * @param cateId
     * @return
     */
    Integer countPostByCateId(Long cateId);


}

