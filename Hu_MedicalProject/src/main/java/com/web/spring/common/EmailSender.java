package com.web.spring.common;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import com.web.spring.member.model.vo.Email;

public class EmailSender {

	@Autowired
	private JavaMailSender mailSender;

	
	public void SendEmail(Email mail) throws Exception {
		System.out.println(mail);
		MimeMessage msg = mailSender.createMimeMessage();
		try {
			
			msg.setSubject(mail.getSubject());
			msg.setText(mail.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(mail.getReceiver()));
			mailSender.send(msg);
			
		}catch(MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		}

	}
}
