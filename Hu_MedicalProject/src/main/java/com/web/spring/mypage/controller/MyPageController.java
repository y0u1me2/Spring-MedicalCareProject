package com.web.spring.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.member.model.service.MemberService;
import com.web.spring.member.model.vo.Member;

@Controller
public class MyPageController {
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder; //단방향 암호화 객체
	
	@Autowired
	private MemberService memberService;//멤버서비스용 객체
	
	//마이페이지 메인 들어가기
	@RequestMapping("myPage/myPageMain")
	public ModelAndView myPageMain() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("client/myPage/myPageMain");
		return mv;
	}
	
	//새비번 기존비번과 중복체크
	@RequestMapping("myPage/passwordCheck")
	public ModelAndView passwordCheck(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		Member m=new Member();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		m.setEmail(email);//받아온 이메일 멤버에 셋팅
		

		
		
		
		return mv;		
	}
}
