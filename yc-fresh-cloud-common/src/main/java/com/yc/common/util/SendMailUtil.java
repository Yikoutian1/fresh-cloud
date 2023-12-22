package com.yc.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

/**
 * @author calyee
 */
@Component
@Configuration
public class SendMailUtil {

	/**
	 * 发件箱
	 */
	@Value("1293580602@qq.com")
	private String sendEmail;

	/**
	 * 发件箱授权码
	 */
	@Value("dihpepdwtahlgefh")
	private String pwd;

	public String getSendEmail() {
		return sendEmail;
	}

	public void setSendEmail(String sendEmail) {
		this.sendEmail = sendEmail;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	/**
	 * 发送html格式的邮件
	 * @param receiveEmail：接收者邮箱
	 * @param name：昵称
	 * @param code：验证码
	 * @return
	 * @throws MessagingException 
	 */
	public boolean sendHtmlMail(String receiveEmail, String name, String code) {
		if (StringUtil.checkNull(receiveEmail, name, code)) {
			return false;
		}
		
		try {
			JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
			
			senderImpl.setHost("smtp.qq.com"); // 邮箱主机。如果是网易则用 smtp.163.com
			senderImpl.setDefaultEncoding("utf-8"); // 编码集
			
			// 建立邮件的消息，我们需要发送的是html格式邮件		
			MimeMessage mimeMessage = senderImpl.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
			
			// 设置收件人，寄件人
			messageHelper.setTo(receiveEmail);
			messageHelper.setFrom(sendEmail);
			messageHelper.setSubject("天天注册中心");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			String str = "<!DOCTYPE html><html><head><meta charset='UTF-8'></head><body><p style='font-size: 20px;font-weight:bold;'>尊敬的："+name+"，您好！</p>"
					+ "<p style='text-indent:2em; font-size: 20px;'>欢迎注册天天生鲜网，您本次的注册码是 "
					+ "<span style='font-size:30px;font-weight:bold;color:red'>"+code+"</span>，3分钟之内有效，请尽快使用！</p>"
					+ "<p style='text-align:right; padding-right: 20px;'"
					+ "<a href='http://www.hyycinfo.com' style='font-size: 18px'>衡阳市源辰信息科技有限公司技术部</a></p>"
					+ "<span style='font-size: 18px; float:right; margin-right: 60px;'>"+sdf.format(new Date())+"</span></body></html>";

			// 设置邮件正文
			messageHelper.setText(str, true);

			// 设置名称
			senderImpl.setUsername(sendEmail); // 发件箱
			senderImpl.setPassword(pwd); //  发件箱密码
			
			Properties prop = new Properties();
			prop.put("mail.smtp.auth", "true"); // 让服务器去认证用户名和密码
			prop.put("mail.smtp.timeout", "2500"); // 连接超时时间
			
			senderImpl.setJavaMailProperties(prop);
			
			senderImpl.send(mimeMessage);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
