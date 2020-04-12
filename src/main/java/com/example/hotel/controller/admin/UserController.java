package com.example.hotel.controller.admin;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.hotel.entity.*;
import com.example.hotel.enums.RoleEnum;
import com.example.hotel.service.*;
import com.example.hotel.controller.common.BaseController;
import com.example.hotel.dto.JsonResult;
import com.example.hotel.util.PageUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 后台用户管理控制器
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;


    @Autowired
    private UserRoleRefService userRoleRefService;


    public static final String USER_NAME = "userName";
    public static final String USER_DISPLAY_NAME = "userDisplayName";
    public static final String EMAIL = "email";

    /**
     * 查询所有分类并渲染user页面
     *
     * @return 模板路径admin/admin_user
     */
    @GetMapping("/customer")
    public String customers(
            @RequestParam(value = "status", defaultValue = "0") Integer status,
            @RequestParam(value = "keywords", defaultValue = "") String keywords,
            @RequestParam(value = "searchType", defaultValue = "") String searchType,
            @RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
            @RequestParam(value = "size", defaultValue = "10") Integer pageSize,
            @RequestParam(value = "sort", defaultValue = "createTime") String sort,
            @RequestParam(value = "order", defaultValue = "desc") String order, Model model) {
        //用户列表
        Page page = PageUtil.initMpPage(pageNumber, pageSize, sort, order);
        User condition = new User();
        condition.setStatus(status);
        if (!StringUtils.isBlank(keywords)) {
            if (USER_NAME.equals(searchType)) {
                condition.setUserName(keywords);
            } else if (USER_DISPLAY_NAME.equals(searchType)) {
                condition.setUserDisplayName(keywords);
            } else if (EMAIL.equals(searchType)) {
                condition.setIdCard(keywords);
            }
        }
        String role = RoleEnum.CUSTOMER.getValue();
        Page<User> users = userService.findByRoleAndCondition(role, condition, page);

        //角色列表
        Integer maxLevel = roleService.findMaxLevelByUserId(getLoginUserId());
        List<Role> roles = roleService.findByLessThanLevel(maxLevel);
        model.addAttribute("roles", roles);
        model.addAttribute("users", users.getRecords());
        model.addAttribute("pageInfo", PageUtil.convertPageVo(page));
        model.addAttribute("status", status);
        model.addAttribute("keywords", keywords);
        model.addAttribute("searchType", searchType);
        model.addAttribute("sort", sort);
        model.addAttribute("order", order);
        model.addAttribute("currentRole", role);
        return "admin/admin_user";
    }

    /**
     * 查询所有分类并渲染user页面
     *
     * @return 模板路径admin/admin_user
     */
    @GetMapping("/worker")
    public String works(
            @RequestParam(value = "status", defaultValue = "0") Integer status,
            @RequestParam(value = "keywords", defaultValue = "") String keywords,
            @RequestParam(value = "searchType", defaultValue = "") String searchType,
            @RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
            @RequestParam(value = "size", defaultValue = "10") Integer pageSize,
            @RequestParam(value = "sort", defaultValue = "createTime") String sort,
            @RequestParam(value = "order", defaultValue = "desc") String order, Model model) {
        //用户列表
        Page page = PageUtil.initMpPage(pageNumber, pageSize, sort, order);
        User condition = new User();
        condition.setStatus(status);
        if (!StringUtils.isBlank(keywords)) {
            if (USER_NAME.equals(searchType)) {
                condition.setUserName(keywords);
            } else if (USER_DISPLAY_NAME.equals(searchType)) {
                condition.setUserDisplayName(keywords);
            } else if (EMAIL.equals(searchType)) {
                condition.setIdCard(keywords);
            }
        }
        String role = RoleEnum.WORKER.getValue();
        Page<User> users = userService.findByRoleAndCondition(role, condition, page);

        //角色列表
        Integer maxLevel = roleService.findMaxLevelByUserId(getLoginUserId());
        List<Role> roles = roleService.findByLessThanLevel(maxLevel);
        model.addAttribute("roles", roles);
        model.addAttribute("users", users.getRecords());
        model.addAttribute("pageInfo", PageUtil.convertPageVo(page));
        model.addAttribute("status", status);
        model.addAttribute("keywords", keywords);
        model.addAttribute("searchType", searchType);
        model.addAttribute("sort", sort);
        model.addAttribute("order", order);
        model.addAttribute("currentRole", role);
        return "admin/admin_user";
    }


    /**
     * 删除用户
     *
     * @param userId 用户Id
     * @return JsonResult
     */
    @DeleteMapping(value = "/delete")
    @ResponseBody
    public JsonResult removeUser(@RequestParam("id") Long userId) {
        userService.delete(userId);
        return JsonResult.success("删除成功");
    }

    /**
     * 添加用户页面
     *
     * @return 模板路径admin/admin_edit
     */
    @GetMapping("/new")
    public String addUser(Model model) {

        //角色列表
        List<Role> roles = roleService.findAll();
        model.addAttribute("roles", roles);

        return "admin/admin_user_add";
    }

    /**
     * 编辑用户页面
     *
     * @return 模板路径admin/admin_edit
     */
    @GetMapping("/edit")
    public String edit(@RequestParam("id") Long userId, Model model) {
        User user = userService.get(userId);
        if (user != null) {
            model.addAttribute("user", user);
            //该用户的角色
            Role currentRole = roleService.findByUserId(userId);
            model.addAttribute("currentRole", currentRole);

            //角色列表
            List<Role> roles = roleService.findAll();
            model.addAttribute("roles", roles);


            return "admin/admin_user_edit";
        }
        return this.renderNotFound();
    }

    /**
     * 批量删除
     *
     * @param ids 用户ID列表
     * @return
     */
    @DeleteMapping(value = "/batchDelete")
    @ResponseBody
    public JsonResult batchDelete(@RequestParam("ids") List<Long> ids) {
        //批量操作
        if (ids == null || ids.size() == 0 || ids.size() >= 100) {
            return JsonResult.error("参数不合法!");
        }
        List<User> userList = userService.findByBatchIds(ids);
        for (User user : userList) {
            userService.delete(user.getId());
        }
        return JsonResult.success("删除成功");
    }

    /**
     * 新增/修改用户
     *
     * @param user user
     * @return 重定向到/admin/user
     */
    @PostMapping(value = "/save")
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public JsonResult saveUser(@ModelAttribute User user,
                               @RequestParam(value = "roleId", required = false) Long roleId) {
        // 1.添加用户
        userService.insertOrUpdate(user);
        if(roleId != null) {
            // 2.先删除该用户的角色关联
            userRoleRefService.deleteByUserId(user.getId());
            // 3.添加角色关联
            userRoleRefService.insert(new UserRoleRef(user.getId(), roleId));
        }
        return JsonResult.success("保存成功");
    }

}
