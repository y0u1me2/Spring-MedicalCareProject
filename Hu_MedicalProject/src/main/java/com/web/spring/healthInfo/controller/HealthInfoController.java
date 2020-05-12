package com.web.spring.healthInfo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.healthInfo.service.HealthInfoService;
import com.web.spring.healthInfo.vo.HealthInformation;

@Controller
public class HealthInfoController {
	
	@Autowired
	private HealthInfoService service;
	
	@RequestMapping("healthInfo/healthInfoMain")
	public String healthInfoMain() {
		return "client/healthInfo/healthInfoMain";
	}
	
	//태그 검색어 페이징
	@RequestMapping("healthInfo/healthTagInfo")
	public ModelAndView healthTagInfo(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		int cPage;
		if(request.getParameter("cPage")==null) {
			cPage=1;
		}else {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}
			
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
	
	//분류 버튼 검색어 
	@RequestMapping("healthInfo/healthBtnInfo")
	public ModelAndView healthBtnInfo(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		
		List<Map<String,String>> list=service.healthBtnInfo();
		
		mv.addObject("list",list);
		
		//view를 설정하기
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//자주찾는 정보 이미지 버튼
	@RequestMapping("healthInfo/frequentInfo")
	public ModelAndView frequentInfo() {
		ModelAndView mv=new ModelAndView();
		List<Map<String,String>> list=service.frequentInfo();
		
		mv.addObject("list",list);
		
		//view를 설정하기
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//메인에서 자주찾는정보 이미지 클릭시 콘트롤러
	@RequestMapping("healthInfo/frequentInfoPic")
	public ModelAndView frequentInfoPic(HealthInformation hi) {
		ModelAndView mv=new ModelAndView();
		
		List<HealthInformation> list=service.frequentInfoPic(hi);
		mv.addObject("list",list);
		//view를 설정하기
		mv.setViewName("client/healthInfo/healthInfoSub");
		
		return mv;
	}
	
	//서브에서 정보 이미지 클릭시 콘트롤러
	@RequestMapping("healthInfo/subFrequentInfoPic")
	public ModelAndView subFrequentInfoPic(HealthInformation hi) {
		ModelAndView mv=new ModelAndView();
		System.out.println(hi);
		
		List<HealthInformation> list=service.frequentInfoPic(hi);
		HealthInformation returnHi=service.subFrequentInfoPic(hi);
		
		System.out.println(returnHi.getConfirmerNo());
		System.out.println(list);
		mv.addObject("hi",returnHi);
		mv.addObject("list",list);
		mv.setViewName("client/healthInfo/healthInfoSubContent");
		
		return mv;
	}
}
