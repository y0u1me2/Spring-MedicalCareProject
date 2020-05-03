package com.web.spring.healthInfo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.healthInfo.service.HealthInfoService;

@Controller
public class HealthInfoController {
	
	@Autowired
	private HealthInfoService service;
	
	@RequestMapping("healthInfo/healthInfoMain")
	public String healthInfoMain() {
		return "client/healthInfo/healthInfoMain";
	}
	
	@RequestMapping("healthInfo/healthTagInfo")
	public ModelAndView healthTagInfo(@RequestParam(required = false, defaultValue = "1") int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerpage=7;
		List<Map<String,String>> list=service.healthTagInfo(cPage, numPerpage);
		int totalData=service.healthTagCount();
		
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		
		
		
		//ModelAndView객체에 데이터 저장하기
		
		mv.addObject("cPage",cPage);
		mv.addObject("totalPage",totalPage);		
		mv.addObject("list",list);
		
		//view를 설정하기
		mv.setViewName("jsonView");
		
		return mv;
	}
}
