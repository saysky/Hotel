package com.example.hotel.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.hotel.common.base.BaseEntity;
import lombok.Data;

/**
 * 预定记录
 * @author 言曌
 * @date 2020/4/5 3:25 下午
 */
@Data
@TableName("record")
public class Record extends BaseEntity {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 房间ID
     */
    private Long postId;

    /**
     * 入店日期
     */
    private String recordDate;


}
