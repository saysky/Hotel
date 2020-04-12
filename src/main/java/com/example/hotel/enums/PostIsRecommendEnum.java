package com.example.hotel.enums;

/**
 * 客房推荐枚举
 */
public enum PostIsRecommendEnum {

    /**
     * 真
     */
    TRUE(1),

    /**
     * 假
     */
    FALSE(0);

    private Integer value;

    PostIsRecommendEnum(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }
}
