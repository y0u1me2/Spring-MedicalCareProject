package com.web.spring.chat.controller;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.member.model.service.HospitalMemberService;
import com.web.spring.member.model.vo.Hospital;

@Controller
public class ChatController {

	@Autowired
	private HospitalMemberService service;
	
	@Autowired
	Logger logger;

	//관리자-사용자 채팅뷰 이동	
		@RequestMapping("/chattingView")
		public String accessChatting() {
			return "client/chatting/chatting";
		}
		
		
		@RequestMapping("/test/test.do")
		public ModelAndView page(ModelAndView mv) {
			
			List<Hospital> list=service.HpMemberList();
			
			logger.debug("병원리스트"+list);
			mv.addObject("list",list);
			mv.setViewName("client/ask/memberList");
			
			return mv;
		}
		


}
