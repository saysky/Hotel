package com.example.hotel.config.shiro;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import com.example.hotel.config.properties.IgnoredUrlsProperties;
import org.apache.shiro.authc.credential.AllowAllCredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


@Configuration
public class ShiroConfig {

    @Bean
    public ShiroDialect shiroDialect() {
        return new ShiroDialect();
    }

    @Bean
    IgnoredUrlsProperties getIgnoredUrlsProperties() {
        return new IgnoredUrlsProperties();
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilter(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        //自定义拦截器
        Map<String, Filter> filtersMap = new LinkedHashMap<String, Filter>();
        //访问权限配置
        filtersMap.put("requestURL", getURLPathMatchingFilter());
        shiroFilterFactoryBean.setFilters(filtersMap);

        //拦截器.
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
        // 配置不会被拦截的链接 顺序判断
        List<String> urls = getIgnoredUrlsProperties().getUrls();
        for (String url : urls) {
            filterChainDefinitionMap.put(url, "anon");
        }
        filterChainDefinitionMap.put("/admin", "authc");
        filterChainDefinitionMap.put("/admin/**", "requestURL");
        filterChainDefinitionMap.put("/**", "anon");

        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);


        // 如果不设置默认会自动寻找Web工程根目录下的"/login"页面
        shiroFilterFactoryBean.setLoginUrl("/");
        // 登录成功后要跳转的链接
        shiroFilterFactoryBean.setSuccessUrl("/");
        //未授权界面;
        shiroFilterFactoryBean.setUnauthorizedUrl("/403");

        return shiroFilterFactoryBean;

    }

    @Bean
    public SecurityManager securityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(myRealm());
        return securityManager;
    }


    @Bean
    public MyRealm myRealm() {
        MyRealm normalRealm = new MyRealm();
        normalRealm.setCredentialsMatcher(hashedCredentialsMatcher());
        return normalRealm;
    }

    /**
     * 访问 权限 拦截器
     *
     * @return
     */
    public URLPathMatchingFilter getURLPathMatchingFilter() {
        return new URLPathMatchingFilter();
    }

    /**
     * MD5加盐加密十次
     *
     * @return
     */
    @Bean
    public HashedCredentialsMatcher hashedCredentialsMatcher() {
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        //散列算法:这里使用MD5算法;
        hashedCredentialsMatcher.setHashAlgorithmName("md5");
        //散列的次数，md5("")
        hashedCredentialsMatcher.setHashIterations(10);
        return hashedCredentialsMatcher;
    }

    @Bean
    public AllowAllCredentialsMatcher allowAllCredentialsMatcher() {
        return new AllowAllCredentialsMatcher();
    }

}