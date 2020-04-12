package com.example.hotel.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.hotel.common.base.BaseService;
import com.example.hotel.entity.Order;
import com.example.hotel.entity.User;

import java.util.List;

/**
 * 订单
 *
 * @author 言曌
 * @date 2020/4/6 2:00 下午
 */
public interface OrderService extends BaseService<Order, Long> {

    /**
     * 根据时间范围查询总金额
     *
     * @param startDate
     * @param endDate
     * @return
     */
    Integer getTotalPriceSum(String startDate, String endDate);

    /**
     * 根据时间范围查询
     * @param startDate
     * @param endDate
     * @param page
     * @return
     */
    Page<Order> findAll(String startDate, String endDate, Page<Order> page);
}
