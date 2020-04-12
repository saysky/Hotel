package com.example.hotel.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.hotel.common.base.BaseEntity;
import lombok.Data;

/**
 * <pre>
 *     友情链接
 * </pre>
 */
@Data
@TableName("link")
public class Link extends BaseEntity {

    /**
     * 友情链接名称
     */
    private String linkName;

    /**
     * 友情链接地址
     */
    private String linkUrl;

    /**
     * 友情链接头像
     */
    private String linkPic;

    /**
     * 友情链接描述
     */
    private String linkDesc;
}
