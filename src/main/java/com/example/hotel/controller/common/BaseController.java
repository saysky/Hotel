package com.example.hotel.controller.common;

import com.example.hotel.entity.User;
import com.example.hotel.enums.RoleEnum;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * Controller抽象类
 */
public abstract class BaseController {

    /**
     * 渲染404页面
     *
     * @return redirect:/404
     */
    public String renderNotFound() {
        return "forward:/404";
    }


    /**
     * 渲染404页面
     *
     * @return redirect:/404
     */
    public String renderNotAllowAccess() {
        return "redirect:/403";
    }

    /**
     * 当前登录用户
     *
     * @return
     */
    public User getLoginUser() {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            return (User) subject.getPrincipal();
        }
        return null;
    }

    /**
     * 当前用户ID
     *
     * @return
     */
    public Long getLoginUserId() {
        return getLoginUser().getId();
    }

    /**
     * 当前用户是管理员
     *
     * @return
     */
    public Boolean loginUserIsAdmin() {
        User loginUser = getLoginUser();
        if (loginUser != null) {
            return  RoleEnum.ADMIN.getValue().equalsIgnoreCase(loginUser.getRole());
        }
        return false;
    }

    /**
     * 当前用户是工作人员
     *
     * @return
     */
    public Boolean loginUserIsWorker() {
        User loginUser = getLoginUser();
        if (loginUser != null) {
            return  RoleEnum.WORKER.getValue().equalsIgnoreCase(loginUser.getRole());
        }
        return false;
    }


    /**
     * 当前用户是消费者
     *
     * @return
     */
    public Boolean loginUserIsCustomer() {
        User loginUser = getLoginUser();
        if (loginUser != null) {
            return RoleEnum.CUSTOMER.getValue().equalsIgnoreCase(loginUser.getRole());
        }
        return false;
    }


}
