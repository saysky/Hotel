package com.example.hotel.util;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.hotel.vo.PageVo;

import java.util.ArrayList;
import java.util.List;


/**
 * @author example
 */
public class PageUtil {

    /**
     * 最大分页大小
     */
    public static final int MAX_PAGE_SIZE = 100;

    /**
     * mybatis分页封装
     *
     * @param pageNumber 页码
     * @param pageSize   页大小
     * @param sort       排序字段
     * @param order      倒序/升序
     * @return
     */
    public static Page initMpPage(long pageNumber, long pageSize, String sort, String order) {

        Page p = null;
        if (StrUtil.isNotBlank(sort)) {
            //驼峰法转下划线, createTime -> create_time
            sort = camelToUnderline(sort);
        }

        if (pageNumber < 1) {
            pageNumber = 1;
        }
        if (pageSize < 1) {
            pageSize = 10;
        }
        if (pageSize > MAX_PAGE_SIZE) {
            pageSize = MAX_PAGE_SIZE;
        }
        if (StrUtil.isNotBlank(sort)) {
            Boolean isAsc = false;
            if (StrUtil.isBlank(order)) {
                isAsc = false;
            } else {
                if ("desc".equals(order.toLowerCase())) {
                    isAsc = false;
                } else if ("asc".equals(order.toLowerCase())) {
                    isAsc = true;
                }
            }
            p = new Page(pageNumber, pageSize);
            if (isAsc) {
                p.setAsc(sort);
            } else {
                p.setDesc(sort);
            }
        } else {
            p = new Page(pageNumber, pageSize);
        }
        return p;
    }

    /**
     * List 手动分页
     *
     * @param page
     * @param list
     * @return
     */
    public static List listToPage(PageVo page, List list) {

        long pageNumber = page.getPage() - 1;
        long pageSize = page.getSize();

        if (pageNumber < 0) {
            pageNumber = 0;
        }
        if (pageSize < 1) {
            pageSize = 10;
        }

        long fromIndex = pageNumber * pageSize;
        long toIndex = pageNumber * pageSize + pageSize;

        if (fromIndex > list.size()) {
            return new ArrayList();
        } else if (toIndex >= list.size()) {
            return list.subList((int) fromIndex, list.size());
        } else {
            return list.subList((int) fromIndex, (int) toIndex);
        }
    }

    /**
     * 驼峰转下划线
     *
     * @param str
     * @return
     */
    private static String camelToUnderline(String str) {
        if (str == null || str.trim().isEmpty()) {
            return "";
        }
        int len = str.length();
        StringBuilder sb = new StringBuilder(len);
        sb.append(str.substring(0, 1).toLowerCase());
        for (int i = 1; i < len; i++) {
            char c = str.charAt(i);
            if (Character.isUpperCase(c)) {
                sb.append("_");
                sb.append(Character.toLowerCase(c));
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    /**
     * 设计缺陷，前端无法获取mybatis-plus的分页page中的pages，所以自己封装一个PageVO
     * 同时将分页信息塞到PageVo中
     *
     * @param page mybatis-plus分页类
     * @return
     */
    public static PageVo convertPageVo(Page page) {
        PageVo pageVo = new PageVo();
        pageVo.setSize(page.getSize());
        pageVo.setTotal(page.getTotal());
        pageVo.setCurrent(page.getCurrent());
        pageVo.setPages(page.getPages());
        List<OrderItem> orderItems = page.getOrders();
        if (orderItems != null && orderItems.size() > 0) {
            pageVo.setSort(orderItems.get(0).getColumn());
            pageVo.setOrder(orderItems.get(0).isAsc() ? "asc" : "desc");
        }
        return pageVo;
    }

}
