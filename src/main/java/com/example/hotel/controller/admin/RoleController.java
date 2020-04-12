package com.example.hotel.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.hotel.entity.Permission;
import com.example.hotel.entity.Role;
import com.example.hotel.dto.JsonResult;
import com.example.hotel.enums.ResourceTypeEnum;
import com.example.hotel.service.PermissionService;
import com.example.hotel.service.RoleService;
import com.example.hotel.util.PageUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 后台角色管理控制器
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    /**
     * 查询所有角色并渲染role页面
     *
     * @return 模板路径admin/admin_role
     */
    @GetMapping
    public String roles(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                        @RequestParam(value = "size", defaultValue = "10") Integer pageSize,
                        @RequestParam(value = "sort", defaultValue = "level") String sort,
                        @RequestParam(value = "order", defaultValue = "desc") String order, Model model) {
        //角色列表
        Page page = PageUtil.initMpPage(pageNumber, pageSize, sort, order);

        Page<Role> roles = roleService.findAll(page);
        model.addAttribute("roles", roles.getRecords());
        model.addAttribute("pageInfo", PageUtil.convertPageVo(page));

        return "admin/admin_role";
    }

    /**
     * 新增/修改角色
     *
     * @param role role对象
     * @return 重定向到/admin/role
     */
    @PostMapping(value = "/save")
    @ResponseBody
    public JsonResult saveRole(@ModelAttribute Role role,
                               @RequestParam(value = "permissionIds") String permissionIds) {

        if (Strings.isNotEmpty(permissionIds)) {
            String[] arr = permissionIds.split(",");
            List<Permission> permissions = new ArrayList<>();
            for (String permissionId : arr) {
                Permission permission = new Permission();
                permission.setId(Long.valueOf(permissionId));
                permissions.add(permission);
            }
            role.setPermissions(permissions);
        }
        roleService.insertOrUpdate(role);
        return JsonResult.success();
    }

    /**
     * 删除角色
     *
     * @param roleId 角色Id
     * @return JsonResult
     */
    @DeleteMapping(value = "/delete")
    @ResponseBody
    public JsonResult checkDelete(@RequestParam("id") Long roleId) {
        //判断这个角色有没有用户
        Integer userCount = roleService.countUserByRoleId(roleId);
        if (userCount != 0) {
            return JsonResult.error("当前角色已关联用户，无法删除");
        }
        roleService.delete(roleId);
        return JsonResult.success("删除角色成功");
    }


    /**
     * 添加用户页面
     *
     * @return 模板路径admin/admin_edit
     */
    @GetMapping("/new")
    public String addRole(Model model) {
        // 所有权限
        model.addAttribute("permissions", getPermissionList());
        return "admin/admin_role_add";
    }

    /**
     * 跳转到修改页面
     *
     * @param roleId roleId
     * @param model  model
     * @return 模板路径admin/admin_role
     */
    @GetMapping(value = "/edit")
    public String toEditRole(Model model, @RequestParam("id") Long roleId) {
        //更新的角色
        Role role = roleService.findByRoleId(roleId);
        //当前角色的权限列表
        role.setPermissions(permissionService.listPermissionsByRoleId(roleId));
        model.addAttribute("updateRole", role);

        // 所有权限
        model.addAttribute("permissions", getPermissionList());

        // 当前角色的权限列表
        List<Long> currentPermissionIds = permissionService.findPermissionByRoleId(roleId).stream().map(p -> p.getId()).collect(Collectors.toList());
        model.addAttribute("currentPermissionIds", currentPermissionIds);
        return "admin/admin_role_edit";
    }

    /**
     * 所有权限
     * @return
     */
    public List<Permission> getPermissionList() {
        //权限列表
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.orderByAsc("sort");
        List<Permission> permissions = permissionService.findAll(queryWrapper);
        // 设置URL为编辑的URL
        for (Permission permission : permissions) {
            permission.setUrl("/admin/permission/edit?id=" + permission.getId());
            if (ResourceTypeEnum.MENU.getCode().equals(permission.getResourceType())) {
                permission.setName(permission.getName() + "[" + ResourceTypeEnum.MENU.getDescription() + "]");
            } else if (ResourceTypeEnum.BUTTON.getCode().equals(permission.getResourceType())) {
                permission.setName(permission.getName() + "[" + ResourceTypeEnum.BUTTON.getDescription() + "]");
            } else if (ResourceTypeEnum.PAGE.getCode().equals(permission.getResourceType())) {
                permission.setName(permission.getName() + "[" + ResourceTypeEnum.PAGE.getDescription() + "]");
            }
        }
        return permissions;
    }
}
