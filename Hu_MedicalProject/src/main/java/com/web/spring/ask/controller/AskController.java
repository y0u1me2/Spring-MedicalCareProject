package com.web.spring.ask.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.common.PageFactory;
import com.web.spring.ask.model.service.AskService;
import com.web.spring.ask.model.vo.Ask;

@Controller
public class AskController {
	@Autowired
	private AskService service;

	
	@RequestMapping("/ask/ask.do")
	public ModelAndView ask(ModelAndView mv,@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="5") int numPerpage) {
		//param은 게시물정보 fileNames 파일
				int totalCount=service.selectAskCount();
				//페이징 처리까지하기
				//별도의 페이징 처리 객체를 생성해서 PAGE처리를 해보자!
				List<Ask> list=service.selectAskList(cPage,numPerpage);
				mv.addObject("list",list);
				mv.setViewName("ask/askList");
				mv.addObject("count",totalCount);
				mv.addObject("pageBar",PageFactory.getPage(totalCount, cPage, numPerpage, "/spring/ask/ask.do"));
		return mv;
	}
	
	

	@RequestMapping("/ask/insertAsk.do")
	public String insertAsk() {
		return "ask/askWrite";
	}
	
	@RequestMapping("/ask/insertEndAsk.do")
	public String insertEndAsk(Ask ask,Model model) {
		System.out.println(ask);
		int result=service.insertAsk(ask);
		String msg="";
		String loc="";
		if(result>0) {
			msg="등록되었습니다.";
			loc="/ask/ask.do";
		}else {
			msg="등록을 실패하였습니다.";
			loc="/ask/insertAsk.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "client/common/msg";
		
	}
	
	
}
