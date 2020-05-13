package com.web.spring.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.ask.model.service.AskService;
import com.web.spring.member.model.vo.Member;

@Controller
public class ChatController {

	@Autowired
	private AskService service;
	
	@Autowired
	Logger logger;

	//관리자-사용자 채팅뷰 이동	
		@RequestMapping("/chattingView")
		public String accessChatting() {
			return "client/chatting/chatting";
		}
		
		@RequestMapping("/ask/search.do")
		public ModelAndView searchAsk(@RequestParam(value="searchType",required=false) String searchType,
				@RequestParam(value="keyword",required=false) String keyword,ModelAndView mv
				) {
			
			//int totalCount=service.searchAskCount();
			//logger.debug(totalCount+"카");

			logger.debug("searchType"+searchType);
			logger.debug("keyword"+keyword);
			Map<String,String> param=new HashMap<String,String>();
			param.put("searchType",searchType);
			param.put("keyword",keyword);
			
			List<Map<String,String>> list=service.searchAsk(param);
			logger.debug("검색List -> "+list);
			
			mv.addObject("list",list);
			mv.setViewName("client/ask/askList");

			return mv;
		}
		
		@RequestMapping("/test/test.do")
		public ModelAndView page(ModelAndView mv) {
			
			List<Member> list=service.memberList();
			
			mv.addObject("list",list);
			mv.setViewName("client/ask/memberList");
			
			return mv;
		}


}
