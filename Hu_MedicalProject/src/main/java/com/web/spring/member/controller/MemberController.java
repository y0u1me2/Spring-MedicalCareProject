package com.web.spring.member.controller;


import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.web.spring.member.model.service.MemberService;
import com.web.spring.member.model.vo.Member;

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
	public String logout(SessionStatus status) {
		if(!status.isComplete() == true) {
			status.setComplete(); //session을 종료
		}
		return "redirect:/";
	}
	
	
}
