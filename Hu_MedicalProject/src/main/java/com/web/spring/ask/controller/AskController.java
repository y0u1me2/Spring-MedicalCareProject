package com.web.spring.ask.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.ask.model.service.AskService;
import com.web.spring.ask.model.vo.Ask;
import com.web.spring.ask.model.vo.AskReply;
import com.web.spring.common.PageFactory;

@Controller
public class AskController {
	@Autowired
	private AskService service;
	
	@Autowired
	Logger logger;


//selectList 및 페이징처리
	@RequestMapping("/ask/ask.do")
	public ModelAndView ask(ModelAndView mv,
			@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="5") int numPerpage,HttpServletRequest request) {
			
		//param은 게시물정보 fileNames 파일
				int totalCount=service.selectAskCount();
				
				//페이징 처리까지하기
				//별도의 페이징 처리 객체를 생성해서 PAGE처리를 해보자!
				List<Ask> list=service.selectAskList(cPage,numPerpage);
				//Reply리스트불러오기
				int replyCount=service.selectReplyCount();
				//logger.debug("replyCount :"+replyCount);
				
				mv.addObject("list",list);
				mv.setViewName("client/ask/askList");
				mv.addObject("count",totalCount);
				mv.addObject("replyCount",replyCount);
				mv.addObject("pageBar",PageFactory.getPage(totalCount, cPage, numPerpage, request.getContextPath()+"/ask/ask.do"));
				
		return mv;
	}
	
//insert
	//전환용
	@RequestMapping("/ask/insertAsk.do")
	public String insertAsk() {
		return "client/ask/askWrite";
	}
	//등록
	@RequestMapping("/ask/insertEndAsk.do")
	public String insertEndAsk(Ask ask,Model model) {
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
	
//selectOne
	@RequestMapping("/ask/askView.do")
	public ModelAndView askView(ModelAndView mv,@RequestParam("no") int no) {
		Ask a=service.selectAskView(no);
		AskReply reply=service.selectReplyView(no);
		mv.addObject("a",a);
		mv.addObject("reply",reply);
		mv.setViewName("client/ask/askView");
		
		return mv;
	}
//update 페이지 전환
	@RequestMapping("/ask/updateAsk.do")
	public ModelAndView updateAsk(ModelAndView mv,@RequestParam("no") int no) {
		Ask a = service.selectAskView(no);
		logger.debug(""+a);
		mv.addObject("a",a);
		mv.setViewName("client/ask/askUpdate");
		return mv;
		/*
		 * int result=service.updatetAsk(no); String msg=""; String loc=""; if(result>0)
		 * { msg="수정되었습니다."; loc="/ask/ask.do"; }else { msg="수정을 실패하였습니다.";
		 * loc="/ask/updateAsk.do"; } mv.addObject("msg",msg); mv.setViewName(loc);
		 * return mv;
		 */
	}

//update--------------------------------------------------------ajax로 구현하기!!!!
	@RequestMapping("/ask/updateEndAsk.do")
	public String updateEndAsk(Ask ask,Model model) {
		int result=service.updateAsk(ask);
		String msg="";
		String loc="";
		if(result>0) {
			msg="수정되었습니다.";
			loc="/ask/ask.do";
		}else {
			msg="등록을 실패하였습니다.";
			loc="/ask/askView.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "client/common/msg";
	}

//delete
	@RequestMapping("/ask/deleteAsk.do")
	public String deleteAsk(@RequestParam(value="no") int no,Model model) {
		int result=service.deleteAsk(no);
		String msg="";
		String loc="";
		if(result>0) {
			msg="삭제되었습니다.";
			loc="/ask/ask.do";
		}else {
			msg="삭제를 실패하였습니다.";
			loc="/ask/updateAsk.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "client/common/msg";
	}
//검색
	@RequestMapping("/ask/search.do")
	public ModelAndView searchType(@RequestParam String searchType,
									@RequestParam String keyword,
									ModelAndView mv) {
		Map<String,String> param=new HashMap<String,String>();
		param.put("searchType",searchType);
		param.put("keyword",keyword);
		List<Ask> list=service.searchList(param);
		mv.addObject("list",list);
		mv.setViewName("client/ask/askList");
		return mv;
	}
}
