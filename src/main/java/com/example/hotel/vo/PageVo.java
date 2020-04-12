package com.example.hotel.vo;

import lombok.Data;

import java.io.Serializable;


/**
 * @author example
 */
@Data
public class PageVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 页号
     */
    private long page = 1;

    /**
     * 页大小
     */
    private long size = 10;

    /**
     * 排序字段
     */
    private String sort = "create_time";

    /**
     * 排序方式 asc/desc
     */
    private String order = "desc";

    /**
     * 当前页码
     */
    private long current;

    /**
     * 总数
     */
    private long total;

    /**
     * 页数
     */
    private long pages;


    public PageVo() {
    }

    public PageVo(int page, int size) {
        this.page = page;
        this.size = size;
    }

    public PageVo(int page, int size, String sort, String order) {
        this.page = page;
        this.size = size;
        this.sort = sort;
        this.order = order;
    }


}
