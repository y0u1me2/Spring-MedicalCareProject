package com.web.spring.member.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.common.MailSender;
import com.web.spring.member.model.service.MemberService;
import com.web.spring.member.model.vo.Mail;
import com.web.spring.member.model.vo.Member;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@Controller
@SessionAttributes(value= {"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService service;

	@Autowired
	private Logger logger;
	//암호화
	@Autowired
	private BCryptPasswordEncoder pwEncoder; //단방향 암호화 객체
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MailSender emailSender;
	@Autowired
	private Mail mail;
	
	@RequestMapping("/member/personEnroll.do")
	public String personEnroll() {
		return "client/member/personEnroll";
	}
	@RequestMapping("/member/hospitalEnroll.do")
	public String hospitalEnroll() {
		return "client/member/hospitalEnroll";
	}
	
	
	@RequestMapping("/member/personEnrollEnd.do")
	public String insertPerson(Member m,Model model) throws Exception {
		
		logger.debug("암호화 전 : " + m.getPassword());
		m.setPassword(pwEncoder.encode(m.getPassword()));
		logger.debug("암호화 후 :" + m.getPassword());
		
		int result = service.insertPerson(m);
		System.out.println(result);
		
		String msg=result>0?"회원가입 성공":"회원가입 실패";
		String loc=result>0?"":"member/personEnrollEnd.do";
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "client/common/msg";
	}
	
	@RequestMapping("/member/memberLogin.do")
	 public String memberLogin(Member m, Model model) throws Exception{
		//System.out.println(m);

		logger.debug(""+m);
		Member loginMember = service.memberLogin(m);
		
		System.out.println(loginMember);
		logger.debug("db : " + loginMember.getPassword());
		logger.debug("param : " + pwEncoder.encode(m.getPassword()));
		 String msg = "";
		 String loc = "/";
		 
		 if(loginMember != null) {
			 if(pwEncoder.matches(m.getPassword(), loginMember.getPassword())) {
				 msg = "로그인 성공";
				 model.addAttribute("loginMember",loginMember);
			 }else {
				 msg="로그인 실패, 비밀번호를 확인하세요!";
			 }
		 }else {
			 msg = "로그인 실패!";
		 }	 
		 model.addAttribute("msg", msg);
		 model.addAttribute("loc", loc);
	     
		 return "client/common/msg";
	 }
	
	@RequestMapping("/member/logout.do")
	public String logout(SessionStatus status,HttpServletResponse res) {
		if(!status.isComplete() == true) {
			status.setComplete(); //session을 종료
			//쿠키삭제
			Cookie c=new Cookie("careView", "0");
			c.setMaxAge(0);
			res.addCookie(c);
		}
		return "redirect:/";
	}
	
	@RequestMapping("/searchEmail")
	public ModelAndView searchEmail(@RequestParam String email, ModelAndView mv) {
		System.out.println(email);
		
		Member member = service.searchEmail(email);
		//String id = member.getEmail();
		//System.out.println(id);
		System.out.println(member);
		if(member != null) {
			mv.addObject("member",0);
			mv.setViewName("jsonView");
		}else {
			mv.addObject("member",1);
			mv.setViewName("jsonView");
		}
		 return mv;
	}
	@RequestMapping("/emailOk")
	public ModelAndView emailOk(@RequestParam String email, ModelAndView mv) {
		System.out.println(email);
		
		Member member = service.searchEmail(email);
		//String id = member.getEmail();
		//System.out.println(id);
		System.out.println(member);
		if(member != null) {
			mv.addObject("member",0);
			mv.setViewName("jsonView");
		}else {
			mv.addObject("member",1);
			mv.setViewName("jsonView");
		}
		 return mv;
	}
	@RequestMapping("/searchPwd.do")
	public ModelAndView sendEmailAction(@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv) throws Exception {

		String USERNAME = (String) paramMap.get("username");
		String EMAIL = (String) paramMap.get("email");
		String PASSWORD = service.getPw(paramMap);

		if(PASSWORD!=null) {
			mail.setContent("비밀번호는 "+PASSWORD+" 입니다."); // 이메일로 보낼 메시지
			mail.setReceiver(EMAIL); // 받는이의 이메일 주소
			mail.setSubject(USERNAME+"님 비밀번호 찾기 메일입니다."); // 이메일로 보낼 제목
			
			try {
				MimeMessage msg = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper 
				= new MimeMessageHelper(msg, true, "UTF-8");
				
				messageHelper.setSubject(mail.getSubject());
				messageHelper.setText(mail.getContent());
				messageHelper.setTo(mail.getReceiver());
				messageHelper.setFrom("qkrejrgus4713@gmail.com"); // 보내는 이의 주소(root-context.xml 에서 선언했지만 적어줬음)
				msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(mail.getReceiver()));
				mailSender.send(msg);
				
			}catch(MessagingException e) {
				System.out.println("MessagingException");
				e.printStackTrace();
			}
			mv.setViewName("redirect:/");
			return mv;
		}else {
			mv.setViewName("redirect:/");
			return mv;
		}
	}
}
