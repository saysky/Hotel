package com.example.hotel.exception;

/**
 * @author 言曌
 * @date 2019-08-09 16:47
 */

public class MyBusinessException extends RuntimeException {

    private Integer code;

    private String message;


    public MyBusinessException() {
        super();
    }

    public MyBusinessException(String message) {
        this.code = 500;
        this.message = message;
    }

    public MyBusinessException(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
