package com.example.hotel.controller.admin;

import com.example.hotel.entity.Permission;
import com.example.hotel.entity.Role;
import com.example.hotel.entity.User;
import com.example.hotel.service.PermissionService;
import com.example.hotel.controller.common.BaseController;
import com.example.hotel.dto.JsonResult;
import com.example.hotel.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * <pre>
 *     后台首页控制器
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin")
public class AdminController extends BaseController {

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RoleService roleService;

    /**
     * 请求后台页面
     *
     * @param model model
     * @return 模板路径admin/admin_index
     */
    @GetMapping
    public String index(Model model) {
//        return "admin/admin_index";
        return "redirect:/admin/order";
    }


    /**
     * 获得当前用户的菜单
     *
     * @return
     */
    @GetMapping(value = "/currentMenus")
    @ResponseBody
    public JsonResult getMenu() {
        Long userId = getLoginUserId();
        List<Permission> permissions = permissionService.findPermissionTreeByUserIdAndResourceType(userId, "menu");
        return JsonResult.success("", permissions);
    }

    /**
     * 获得当前登录用户
     */
    @GetMapping(value = "/currentUser")
    @ResponseBody
    public JsonResult currentUser() {
        User user = getLoginUser();
        if (user != null) {
            return JsonResult.success("", user);
        }
        return JsonResult.error("用户未登录");
    }

    /**
     * 获得当前用户角色编码
     */
    @GetMapping(value = "/currentRole")
    @ResponseBody
    public JsonResult currentRole() {
        Role role = roleService.findByUserId(getLoginUserId());
        if (role == null) {
            return JsonResult.error("用户未登录或无角色");
        }
        return JsonResult.success("", role.getRole());
    }

}
