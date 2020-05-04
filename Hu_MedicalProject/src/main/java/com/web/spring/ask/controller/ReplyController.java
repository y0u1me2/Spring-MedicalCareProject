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
import com.web.spring.ask.model.vo.AskReply;

@Controller
public class ReplyController {
	
	@Autowired
	private AskService service;
	
	@RequestMapping("/reply/insertReply.do")
	public ModelAndView insertReply(@RequestParam Map map,ModelAndView mv) {
		
		int result=service.insertReply(map);
		String msg="";
		String loc="";
		if(result>0) {
			msg="답변을 등록하였습니다.";
			loc="/ask/askView.do";
		}else {
			msg="답변등록을 실패하였습니다.";
			loc="/ask/askView.do";
		}
		mv.addObject("msg",msg);
		mv.setViewName(loc);
		return mv;
	}
	
}
