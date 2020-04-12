package com.example.hotel.service;

import com.example.hotel.common.base.BaseService;
import com.example.hotel.entity.Record;

import java.util.List;

/**
 * 预定
 * @author 言曌
 * @date 2020/4/6 2:00 下午
 */
public interface RecordService extends BaseService<Record, Long> {

    /**
     * 根据房间ID和日期列表查询预定
     *
     * @param postId
     * @param dateList
     * @return
     */
    List<Record> findByPostIdAndRecordDate( Long postId, List<String> dateList);

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
    Integer delete(Long postId, Long userId, List<String> dateList);
}
