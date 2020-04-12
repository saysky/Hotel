package com.example.hotel.enums;

/**
 * <pre>
 *     订单状态enum
 * </pre>
 */
public enum OrderStatusEnum {

    /**
     * 待支付
     */
    NOT_PAY(0),

    /**
     * 已支付
     */
    HAS_PAY(1),

    /**
     * 已完结
     */
    FINISHED(2),

    /**
     * 已关闭
     */
    CLOSED(3);

    private Integer code;

    OrderStatusEnum(Integer code) {
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }

}
