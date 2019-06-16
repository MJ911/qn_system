package com.nwafu.qn_system.service;

public interface MailService {
	 /**
     *  发送多媒体类型邮件
     * @author 宋明桂
     * @param to
     * @param subject
     * @param content
     */
    void sendMimeMail(String to, String subject, String content);
}
