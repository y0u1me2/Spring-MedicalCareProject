package com.web.spring.admin.person.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.admin.person.service.AdminPersonService;
import com.web.spring.common.PageFactory;
import com.web.spring.common.PageFactory2;
import com.web.spring.member.model.vo.Member;
import com.web.spring.notice.model.vo.Notice;
import com.web.spring.notice.model.vo.NoticeAttachment;


@Controller
public class AdminPersonController {

	@Autowired
	private AdminPersonService service;
	
	@RequestMapping("/admin/memberInfo.do")
	public ModelAndView adminPerson(@RequestParam(required=false, defaultValue="1") int cPage, 
			   @RequestParam(required=false, defaultValue="5") int numPerpage,
			   ModelAndView mv) {
		List<Member> list = service.adminPerson(cPage,numPerpage);
		int totalCount = service.personCount();
		
		mv.addObject("list",list);
		mv.addObject("count",totalCount);

		mv.addObject("pageBar",PageFactory2.getPage(totalCount, cPage, numPerpage, "/spring/admin/memberInfo.do"));
		mv.setViewName("admin/member/member");
		return mv;
	}
	
	@RequestMapping("/admin/personDelete")
	public String personDelete(@RequestParam("personNO") int personNO, Model m) {
		  
		System.out.println(personNO);
		int result = service.personDelete(personNO);	
		  	  
		  String msg=""; 
		  String loc="/admin/person.do";
		 
		  if(result>0) { 
			  msg="회원 탈퇴 완료되었습니다."; 			
			  
		  }else {
			  msg="회원 탈퇴 실패하였습니다"; 			
		  } 
		  
		  
		  m.addAttribute("msg", msg);
		  m.addAttribute("loc",loc); 
		  
		  return "admin/common/msg"; 
	}
	
}
