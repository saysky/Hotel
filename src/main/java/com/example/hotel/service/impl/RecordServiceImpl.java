package com.example.hotel.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.hotel.entity.Record;
import com.example.hotel.mapper.RecordMapper;
import com.example.hotel.service.RecordService;
import org.apache.commons.collections.ListUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 言曌
 * @date 2020/4/6 2:01 下午
 */
@Service
public class RecordServiceImpl implements RecordService {

    @Autowired
    private RecordMapper recordMapper;

    @Override
    public BaseMapper<Record> getRepository() {
        return recordMapper;
    }

    @Override
    public QueryWrapper<Record> getQueryWrapper(Record record) {
        //对指定字段查询
        QueryWrapper<Record> queryWrapper = new QueryWrapper<>();
        if (record != null) {
            if (record.getUserId() != null) {
                queryWrapper.eq("user_id", record.getUserId());
            }
            if (record.getPostId() != null) {
                queryWrapper.eq("post_id", record.getPostId());
            }
            if (record.getRecordDate() != null) {
                queryWrapper.eq("record_date", record.getRecordDate());
            }
        }
        return queryWrapper;
    }

    @Override
    public List<Record> findByPostIdAndRecordDate(Long postId, List<String> dateList) {
        return recordMapper.findByPostIdAndRecordDate(postId, dateList);
    }

    @Override
    public List<Record> findByPostId(Long postId) {
        return recordMapper.findByPostId(postId);
    }

    @Override
    public Integer delete(Long postId, Long userId, List<String> dateList) {
        if (dateList != null && dateList.size() > 0) {
            return recordMapper.delete(postId, userId, dateList);
        }
        return 0;
    }
}
