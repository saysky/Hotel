package com.example.hotel.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.hotel.entity.Order;
import com.example.hotel.entity.User;
import com.example.hotel.mapper.OrderMapper;
import com.example.hotel.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 言曌
 * @date 2020/4/6 2:01 下午
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public BaseMapper<Order> getRepository() {
        return orderMapper;
    }

    @Override
    public QueryWrapper<Order> getQueryWrapper(Order order) {
        //对指定字段查询
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        if (order != null) {
            if (order.getUserId() != null) {
                queryWrapper.eq("user_id", order.getUserId());
            }
            if (order.getPostId() != null) {
                queryWrapper.eq("post_id", order.getPostId());
            }
            if (StrUtil.isNotBlank(order.getPhone())) {
                queryWrapper.eq("phone", order.getPhone());
            }
            if (order.getStatus() != null) {
                queryWrapper.eq("status", order.getStatus());
            }
            if (order.getStartDate() != null) {
                queryWrapper.eq("start_date", order.getStartDate());
            }
        }
        return queryWrapper;
    }

    @Override
    public Integer getTotalPriceSum(String startDate, String endDate) {
        return orderMapper.getTotalPriceSum(startDate, endDate);
    }

    @Override
    public Page<Order> findAll(String startDate, String endDate, Page<Order> page) {
        return page.setRecords(orderMapper.findAll(startDate, endDate, page));
    }
}
