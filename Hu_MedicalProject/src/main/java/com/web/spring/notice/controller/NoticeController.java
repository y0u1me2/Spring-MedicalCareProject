package com.web.spring.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.notice.model.service.NoticeService;
import com.web.spring.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	
	@RequestMapping("/notice/noticeList")
	public ModelAndView noticeList(@RequestParam(required=false, defaultValue="1") int cPage, 
								   @RequestParam(required=false, defaultValue="5") int numPerpage,
								   ModelAndView mv) {
		List<Notice> list = service.notice(cPage,numPerpage);
		int totalCount = service.noticeCount();
		
		mv.addObject("list",list);
		mv.addObject("count",totalCount);
		mv.setViewName("client/notice/noticeList");
		return mv;
	}
	
	
}
