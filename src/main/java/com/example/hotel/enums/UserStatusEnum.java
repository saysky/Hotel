package com.example.hotel.enums;

/**
 * 用户状态enum
 */
public enum UserStatusEnum {

    /**
     * 正常
     */
    NORMAL(0),

    /**
     * 禁止登录
     */
    BAN(1);


    private Integer code;

    UserStatusEnum(Integer code) {
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }
}
