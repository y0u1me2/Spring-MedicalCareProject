package com.web.spring.admin.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.admin.hospital.model.service.AdminHospitalService;
import com.web.spring.common.PageFactory2;
import com.web.spring.map.model.vo.Hospital2;
import com.web.spring.member.model.vo.HospitalMember;

@Controller
public class AdminHospitalMemberController {
	@Autowired
	private AdminHospitalService service;
	
	//병원회원 리스트 페이지로 이동
	@RequestMapping("/admin/hospitalList")
	private ModelAndView hospitalList(
			@RequestParam(required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false, defaultValue = "10") int numPerPage, ModelAndView mv) {
		
		List<HospitalMember> list = service.selectAllMembers(cPage, numPerPage);
		int totalCount = service.totalMemberCount();
		
		mv.addObject("list", list);
		mv.addObject("pageBar", PageFactory2.getPage(totalCount, cPage, numPerPage, "/spring/admin/hospitalList"));
		mv.setViewName("admin/hospital/hospitalList");
		return mv;
	}
	
	//병원 상세 정보 페이지로 이동
	@RequestMapping("/admin/hospitalDetail")
	private ModelAndView hospitalDetail(String hospNo, ModelAndView mv) {
		Hospital2 h = service.selectOneHospital(hospNo);
		mv.addObject("h", h);
		mv.setViewName("admin/hospital/hospitalDetail");
		return mv;
	}
	
	//병원 정보 수정 페이지로 이동
	@RequestMapping("/admin/hospitalModify")
	private ModelAndView hospitalModify(String hospNo, ModelAndView mv) {
		Hospital2 h = service.selectOneHospital(hospNo);
		mv.addObject("h", h);
		mv.setViewName("admin/hospital/hospitalModify");
		return mv;
	}
	
	//병원 정보 수정 완료
	@RequestMapping("/admin/hospitalModifyEnd")
	private ModelAndView hospitalModifyEnd(Hospital2 h, ModelAndView mv) {
		System.out.println(h);
		int result = service.updateOneHospital(h);
		
		if(result>0) {
			mv.addObject("msg", "수정 완료");
			mv.addObject("loc", "/admin/hospitalList");
		}else {
			mv.addObject("msg", "수정 실패");
			mv.addObject("loc", "/admin/hospitalList");
		}
		
		mv.setViewName("admin/common/msg");
		return mv;
	}
	
	//회원가입 승인
	@RequestMapping("/admin/hospitalApproval")
	private String hospitalApproval(int no) {
		int result = service.updateMemberStatus(no);
		return "redirect:/admin/hospitalList";
	}
		
		
}

