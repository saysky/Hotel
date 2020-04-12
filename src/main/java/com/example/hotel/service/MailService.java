package com.example.hotel.service;


import javax.mail.MessagingException;

/**
 * <pre>
 *     邮件发送业务逻辑接口
 * </pre>
 */
public interface MailService {

    /**
     * 发送邮件
     *
     * @param to      接收者
     * @param title   标题
     * @param content 内容
     */
    void sendMail(String to, String title, String content) throws MessagingException;

}
