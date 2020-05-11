package com.web.spring.ask.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.ask.model.service.AskService;
import com.web.spring.ask.model.vo.AskReply;

@Controller
public class ReplyController {
	@Autowired
	Logger logger;
	@Autowired
	private AskService service;
	
	
	
	
	
//insert	
	@RequestMapping("/reply/insertReply.do")
	public String insertReply(AskReply reply,Model model,@RequestParam("replyRefNo") int no) {
		int result=service.insertReply(reply);
		//replyCount
		int replyCnt=service.replyCnt(no);// update
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="답변을 등록하였습니다.";
			loc="/ask/askView.do?no="+no;
		}else {
			msg="답변등록을 실패하였습니다.";
			loc="/ask/askView.do?no="+no;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "client/common/msg";
	}
	
//delete	
	@RequestMapping("/reply/deleteReply.do")
	public String deleteAsk(@RequestParam(value="no") int no,Model model) {
		int result=service.deleteReply(no);
		int result1=service.deleteReplyCnt(no);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="삭제되었습니다.";
			loc="/ask/askView.do?no="+no;
		}else {
			msg="삭제를 실패하였습니다.";
			loc="/ask/askView.do?no="+no;
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "client/common/msg";
	}
	
//ajax update-selectOne가져오기
	@RequestMapping("/reply/selectReply.do")
	public ModelAndView selectReply(@RequestParam(value="no") int no,ModelAndView mv) {
		AskReply reply1 = service.selectReplyView(no);
		
		mv.addObject("reply",reply1);
		mv.setViewName("jsonView");
		return mv;
	}
	
	//update하기	
	@RequestMapping("/reply/updateReply.do")
	public ModelAndView updateReply(@RequestParam(value="replyContent") String replyContent,
			@RequestParam(value="replyRefNo") int replyRefNo,ModelAndView mv) {
		
		
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("replyContent",replyContent);
		param.put("replyNo",replyRefNo);

		
		int result=service.updateReply(param);
		
		mv.addObject("result",result);
		mv.setViewName("jsonView");
		return mv;
	}


	

}
