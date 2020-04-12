package com.example.hotel.enums;

/**
 * <pre>
 *     角色枚举
 * </pre>
 *
 */
public enum RoleEnum {

    /**
     * 管理员
     */
    ADMIN("admin"),

    /**
     * 客户
     */
    CUSTOMER("customer"),

    /**
     * 工作人员
     */
    WORKER("worker");

    private String value;

    RoleEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
