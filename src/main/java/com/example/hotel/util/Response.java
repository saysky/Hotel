package com.example.hotel.util;

public class Response<T> {

    private Boolean success;

    private String message;

    private T data;

    /**
     * 状态码
     */
    private Integer status = 200;

    public Response() {
    }

    public Response(Boolean success) {
        this.success = success;
    }

    public Response(Boolean success, String message) {
        this.success = success;
        this.message = message;
    }

    public Response(Boolean success, String message, T data) {
        this.success = success;
        this.message = message;
        this.data = data;
    }

    public Response(Boolean success, Integer status, String message, T data) {
        this.success = success;
        this.message = message;
        this.data = data;
        this.status = status;
    }


    public static <T> Response<T> yes() {
        return new Response(true, 200, "成功", null);
    }

    public static <T> Response<T> yes(T data) {
        return new Response(true, 200, "成功", data);
    }

    public static <T> Response<T> yes(String message, T data) {
        return new Response(true, 200, message, data);
    }

    public static <T> Response<T> no() {
        return new Response(false, 500, "失败", null);
    }

    public static <T> Response<T> no(String message) {
        return new Response(false, 500, message, null);
    }

    public static <T> Response<T> no(Integer status, String message) {
        return new Response(false, status, message, null);
    }

    public Boolean isSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Boolean getSuccess() {
        return success;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
