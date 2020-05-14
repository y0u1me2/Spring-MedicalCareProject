package com.web.spring.healthInfo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.web.spring.healthInfo.service.HealthInfoService;
import com.web.spring.healthInfo.vo.HealthInformation;

@Controller
public class HealthInfoController {
	
	@Autowired
	private HealthInfoService service;
	
	@RequestMapping("healthInfo/healthInfoMain")
	public ModelAndView healthInfoMain() {
		ModelAndView mv=new ModelAndView();
		int totalCount=service.totalCount();
		mv.addObject("totalCount",totalCount);
		mv.setViewName("client/healthInfo/healthInfoMain");
		return mv;
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
		//건강정보글 객체
		HealthInformation returnHi=service.subFrequentInfoPic(hi);
		//건강정보글 첨부사진들
		List<Map<String,String>> list=service.subFrequentInfoContent(hi.getHealthInfoNo());
		//검수자 불러오기
		Map<String,String> confirmer=service.selectConfirmer(returnHi.getConfirmerNo());
		
		mv.addObject("confirmer",confirmer);
		mv.addObject("contentList",list);
		mv.addObject("hi",returnHi);
		mv.setViewName("client/healthInfo/healthInfoSubContent");
		
		return mv;
	}
	
	//상세보기에서 미니모드 화면 
	@RequestMapping("healthInfo/healthInfoMiniMode.do")
	public ModelAndView healthInfoMiniMode(HealthInformation hi) {
		ModelAndView mv=new ModelAndView();
		
		List<HealthInformation> list=service.searchInfoPicStep(hi);
		mv.addObject("list",list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	//검색기능 자동완성
	@RequestMapping("/healthInfo/searchInformation")
	@ResponseBody
	public List<String> searchInformation(@RequestParam (value="term", required=false, defaultValue="") String term) {
		List<Map<String,String>> list=service.searchInformation(term);
		List<String> result=new ArrayList();
		for(int i=0;i<list.size();i++) {
			result.add(list.get(i).get("HEALTHINFOTITLE"));
		}
		return result;
	}
	
	//검색 기능
	@RequestMapping("/healthInfo/searchHealthInfo")
	public ModelAndView searchHealthInfo(String searchKeyword) {
		ModelAndView mv=new ModelAndView();
		System.out.println(searchKeyword);
		
		HealthInformation returnHi=service.searchHealthInfoKeyword(searchKeyword); //건강정보글 첨부사진들
		if(returnHi==null) {
			List<Map<String,String>> healthInfoList=service.searchHealthInfoList(searchKeyword);
			mv.addObject("healthInfoList",healthInfoList);
			mv.setViewName("client/healthInfo/healthInfoSearchList");			
		}else {
			List<Map<String,String>> list=service.subFrequentInfoContent(returnHi.getHealthInfoNo()); //검수자 불러오기
			Map<String,String> confirmer=service.selectConfirmer(returnHi.getConfirmerNo());
			
			mv.addObject("confirmer",confirmer); mv.addObject("contentList",list);
			mv.addObject("hi",returnHi);			
			mv.setViewName("client/healthInfo/healthInfoSubContent");
		}	
		
		return mv;
	}
	
}
