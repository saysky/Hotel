package com.example.hotel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.hotel.entity.Record;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author liuyanzhao
 */
@Mapper
public interface RecordMapper extends BaseMapper<Record> {

    /**
     * 根据房间ID和日期列表查询预定
     *
     * @param postId
     * @param dateList
     * @return
     */
    List<Record> findByPostIdAndRecordDate(@Param("postId") Long postId,
                                           @Param("list") List<String> dateList);

    /**
     * 获得某个房间的预定记录
     * @param postId
     * @return
     */
    List<Record> findByPostId(Long postId);

    /**
     * 删除
     * @param postId
     * @param userId
     * @param dateList
     * @return
     */
    Integer delete(@Param("postId") Long postId,
                   @Param("userId") Long userId,
                   @Param("list") List<String> dateList);
}

