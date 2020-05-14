package com.web.spring.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	
	
	//마이페이지 메인 들어가기
	@RequestMapping("myPage/myPageMain")
	public ModelAndView myPageMain() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("client/myPage/myPageMain");
		return mv;
	}
}
