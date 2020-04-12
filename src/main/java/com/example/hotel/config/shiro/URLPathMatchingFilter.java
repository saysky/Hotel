package com.example.hotel.config.shiro;

import com.alibaba.fastjson.JSONObject;
import com.example.hotel.service.PermissionService;
import com.example.hotel.util.SpringUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.PathMatchingFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * URL拦截器
 */
public class URLPathMatchingFilter extends PathMatchingFilter {


    PermissionService permissionService = null;
    private PermissionService permissionService() {
        if (permissionService == null) {
            permissionService = (PermissionService) SpringUtil.getBean("permissionServiceImpl");
        }
        return permissionService;
    }

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        //请求的url
        String requestURL = getPathWithinApplication(request);
        System.out.println("请求的url :" + requestURL);
        Subject subject = SecurityUtils.getSubject();
        if (!subject.isAuthenticated()) {
            // 如果没有登录, 进入登录流程
            WebUtils.issueRedirect(request, response, "/");
            return false;
        }

        //从session里读取当前用户的权限URL列表
        Set<String> urls = (Set<String>) subject.getSession().getAttribute("permissionUrls");
        if (urls.contains(requestURL)) {
            return true;
        }

        //没有权限
        if (isAjax((HttpServletRequest) request)) {
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/json; charset=utf-8");
            PrintWriter writer = response.getWriter();
            Map<String, Object> map = new HashMap<>();
            map.put("code", 0);
            map.put("msg", "没有权限访问");
            writer.write(JSONObject.toJSONString(map));
        } else {
            WebUtils.issueRedirect(request, response, "/403");
        }

        return false;
    }


    public static boolean isAjax(HttpServletRequest httpRequest) {
        return (httpRequest.getHeader("X-Requested-With") != null
                && "XMLHttpRequest"
                .equals(httpRequest.getHeader("X-Requested-With").toString()));
    }

}