package com.web.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.hospital.model.service.HospitalMemberService;
import com.web.spring.hospital.model.vo.Hospital;

@Controller
public class HospitalMemberController {
	@Autowired
	private HospitalMemberService service;
	
	@RequestMapping("/hospitalEnrollEnd.do")
	private ModelAndView hospitalEnrollEnd(Hospital h, ModelAndView mv) {
		int result = service.hospitalEnroll(h);
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg="가입 요청이 완료되었습니다. 관리자 승인 후 서비스를 사용하실 수 있습니다.";
			loc = "/";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
		}else {
			msg="회원 가입에 실패하였습니다.";
			mv.addObject("msg", msg);
		}
		
		mv.setViewName("client/common/msg");
		
		return mv;
	}
	
}
