package com.example.hotel.service.impl;

import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.hotel.dto.JsonResult;
import com.example.hotel.exception.MyBusinessException;
import com.example.hotel.common.constant.CommonConstant;
import com.example.hotel.entity.Role;
import com.example.hotel.mapper.OrderMapper;
import com.example.hotel.mapper.RecordMapper;
import com.example.hotel.mapper.UserMapper;
import com.example.hotel.entity.User;
import com.example.hotel.enums.TrueFalseEnum;
import com.example.hotel.service.PostService;
import com.example.hotel.service.RoleService;
import com.example.hotel.service.UserService;
import com.example.hotel.util.Md5Util;
import com.example.hotel.util.RegexUtil;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * 用户业务逻辑实现类
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleService roleService;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private RecordMapper recordMapper;

    @Override
    public User findByUserName(String userName) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_name", userName);
        return userMapper.selectOne(queryWrapper);
    }

    @Override
    public User findByIdCard(String idCard) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("id_card", idCard);
        return userMapper.selectOne(queryWrapper);
    }

    @Override
    public void updatePassword(Long userId, String password) {
        User user = new User();
        user.setId(userId);
        user.setUserPass(Md5Util.toMd5(password, CommonConstant.PASSWORD_SALT, 10));
        userMapper.updateById(user);
    }

    @Override
    public Page<User> findByRoleAndCondition(String roleName, User condition, Page<User> page) {
        List<User> users = new ArrayList<>();
        if (Objects.equals(roleName, CommonConstant.NONE)) {
            users = userMapper.findByCondition(condition, page);
        } else {
            Role role = roleService.findByRoleName(roleName);
            if (role != null) {
                users = userMapper.findByRoleIdAndCondition(role.getId(), condition, page);
            }
        }
        return page.setRecords(users);
    }

    @Override
    public BaseMapper<User> getRepository() {
        return userMapper;
    }

    @Override
    public QueryWrapper<User> getQueryWrapper(User user) {
        //对指定字段查询
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        if (user != null) {
            if (StrUtil.isNotBlank(user.getUserName())) {
                queryWrapper.eq("user_name", user.getUserName());
            }
            if (StrUtil.isNotBlank(user.getIdCard())) {
                queryWrapper.eq("id_card", user.getIdCard());
            }
        }
        return queryWrapper;
    }

    @Override
    public User insert(User user) {
        // 1.检查长度
        basicCheck(user);
        // 2.验证手机号和身份证号码是否存在
        checkUserNameAndIdCard(user);
        // 3.添加
        userMapper.insert(user);
        return user;
    }

    @Override
    public User update(User user) {
        // 1.检查长度
        basicCheck(user);
        // 2.验证手机号和身份证号码是否存在
        checkUserNameAndIdCard(user);
        // 3.更新
        userMapper.updateById(user);
        return user;
    }

    private void checkUserNameAndIdCard(User user) {
        //验证手机号和身份证号码是否存在
        if (user.getUserName() != null) {
            User nameCheck = findByUserName(user.getUserName());
            Boolean isExist = (user.getId() == null && nameCheck != null) ||
                    (user.getId() != null && nameCheck != null && !Objects.equals(nameCheck.getId(), user.getId()));
            if (isExist) {
                throw new MyBusinessException("手机号已经存在");
            }
        }
        if (user.getIdCard() != null) {
            User idCardCheck = findByIdCard(user.getIdCard());
            Boolean isExist = (user.getId() == null && idCardCheck != null) ||
                    (user.getId() != null && idCardCheck != null && !Objects.equals(idCardCheck.getId(), user.getId()));
            if (isExist) {
                throw new MyBusinessException("身份证号码已经存在");
            }
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long userId) {
        //删除用户
        User user = get(userId);
        if (user != null) {
            // 1.修改用户状态为已删除
            userMapper.deleteById(userId);
            // 2.修改用户和角色关联
            roleService.deleteByUserId(userId);
            // 3.删除订单
            Map<String, Object> map = new HashMap<>();
            map.put("user_id", userId);
            orderMapper.deleteByMap(map);
            // 4.删除预定
            recordMapper.deleteByMap(map);
        }
    }

    @Override
    public User insertOrUpdate(User user) {
        if (user.getId() == null) {
            user.setUserAvatar("/static/images/avatar/" + RandomUtils.nextInt(1, 41) + ".jpeg");
            insert(user);
        } else {
            update(user);
        }
        return user;
    }

    private void basicCheck(User user) {
        String userName = user.getUserName();
        String idCard = user.getIdCard();
        String userDisplayName = user.getUserDisplayName();
        // 1.身份证号码是否合法
        if (StringUtils.isNotEmpty(idCard) && !RegexUtil.isIdCard(idCard)) {
            throw new MyBusinessException("身份证号码不合法");
        }
        // 2.手机号码长度是否合法
        if (StringUtils.isNotEmpty(userName) && userName.length() != 11) {
            throw new MyBusinessException("手机号码不合法");
        }
        // 3.姓名长度是否合法
        if (StringUtils.isNotEmpty(userDisplayName) && userDisplayName.length() > 10 || userDisplayName.length() < 2) {
            throw new MyBusinessException("姓名长度不合法");
        }
    }

    @Override
    public User get(Long id) {
        User user = userMapper.selectById(id);
        return user;
    }
}
