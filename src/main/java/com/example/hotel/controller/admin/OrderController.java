package com.example.hotel.controller.admin;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.hotel.controller.common.BaseController;
import com.example.hotel.dto.JsonResult;
import com.example.hotel.dto.QueryCondition;
import com.example.hotel.entity.Order;
import com.example.hotel.enums.OrderStatusEnum;
import com.example.hotel.service.OrderService;
import com.example.hotel.service.RecordService;
import com.example.hotel.util.DateUtil;
import com.example.hotel.util.PageUtil;
import com.example.hotel.util.RegexUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <pre>
 *     订单管理控制器
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/order")
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private RecordService recordService;

    /**
     * 查询所有订单并渲染order页面
     *
     * @return 模板路径admin/admin_order
     */
    @GetMapping
    public String orders(@RequestParam(value = "page", defaultValue = "0") Integer pageNumber,
                         @RequestParam(value = "size", defaultValue = "10") Integer pageSize,
                         @RequestParam(value = "sort", defaultValue = "id") String sort,
                         @RequestParam(value = "order", defaultValue = "desc") String order, Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize, sort, order);
        Page<Order> orderPage = null;
        Boolean isCustomer = loginUserIsCustomer();
        if (isCustomer) {
            Order orderCondition = new Order();
            orderCondition.setUserId(getLoginUserId());
            QueryCondition queryCondition = new QueryCondition();
            queryCondition.setData(orderCondition);
            orderPage = orderService.findAll(page, queryCondition);
        } else {
            orderPage = orderService.findAll(page);
        }
        model.addAttribute("orders", orderPage.getRecords());
        model.addAttribute("pageInfo", PageUtil.convertPageVo(page));
        return "admin/admin_order";
    }


    /**
     * 删除订单
     *
     * @param id 订单Id
     * @return JsonResult
     */
    @DeleteMapping(value = "/delete")
    @ResponseBody
    public JsonResult delete(@RequestParam("id") Long id) {
        Order order = orderService.get(id);
        if (order == null) {
            return JsonResult.error("订单不存在");
        }

        orderService.delete(id);


        Long postId = order.getPostId();
        Long userId = order.getUserId();
        List<String> dateList = DateUtil.getBetweenDates(order.getStartDate(), order.getQuantity());

        // 释放预定
        recordService.delete(postId, userId, dateList);
        return JsonResult.success("删除成功");
    }

    /**
     * 完结订单
     *
     * @param id 订单Id
     * @return JsonResult
     */
    @PostMapping(value = "/finish")
    @ResponseBody
    public JsonResult finish(@RequestParam("id") Long id) {
        Order order = orderService.get(id);
        if (order == null) {
            return JsonResult.error("订单不存在");
        }

        order.setStatus(OrderStatusEnum.FINISHED.getCode());
        orderService.update(order);
        return JsonResult.success("完结成功");
    }

    /**
     * 关闭订单
     *
     * @param id 订单Id
     * @return JsonResult
     */
    @PostMapping(value = "/close")
    @ResponseBody
    @Transactional
    public JsonResult close(@RequestParam("id") Long id) {
        // 修改订单状态
        Order order = orderService.get(id);
        if (order == null) {
            return JsonResult.error("订单不存在");
        }

        order.setStatus(OrderStatusEnum.CLOSED.getCode());
        orderService.update(order);

        Long postId = order.getPostId();
        Long userId = order.getUserId();
        List<String> dateList = DateUtil.getBetweenDates(order.getStartDate(), order.getQuantity());

        // 释放预定
        recordService.delete(postId, userId, dateList);
        return JsonResult.success("关闭成功");
    }

    /**
     * 财务页面
     *
     * @param model
     * @return
     */
    @GetMapping("/finance")
    public String finance(@RequestParam(value = "startDate", required = false) String startDate,
                          @RequestParam(value = "endDate", required = false) String endDate,
                          @RequestParam(value = "page", defaultValue = "0") Integer pageNumber,
                          @RequestParam(value = "size", defaultValue = "10") Integer pageSize,
                          @RequestParam(value = "sort", defaultValue = "id") String sort,
                          @RequestParam(value = "order", defaultValue = "desc") String order,
                          Model model) {

        Page page = PageUtil.initMpPage(pageNumber, pageSize, sort, order);
        Page<Order> orderPage = orderService.findAll(startDate, endDate, page);
        model.addAttribute("orders", orderPage.getRecords());
        model.addAttribute("pageInfo", PageUtil.convertPageVo(page));

        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);

        Integer totalPrice = orderService.getTotalPriceSum(startDate, endDate);
        model.addAttribute("totalPrice", totalPrice == null ? 0 : totalPrice);
        return "admin/admin_finance";
    }


}
