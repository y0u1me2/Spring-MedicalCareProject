package com.web.spring.admin.healthInfo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.admin.healthInfo.service.AdminHealthInfoService;
import com.web.spring.healthInfo.vo.Confirmer;
import com.web.spring.healthInfo.vo.DisesaseCategory;
import com.web.spring.healthInfo.vo.HealthInfoContentPic;
import com.web.spring.healthInfo.vo.HealthInformation;

@Controller
public class AdminHealthInfoController {
	
	@Autowired
	private AdminHealthInfoService service;
	
	
	@RequestMapping("admin/healthInfo.do")
	public ModelAndView adminHealthInfoMain() {
		ModelAndView mv=new ModelAndView();
		
		List <Map<String,String>> list=service.selectAllDisesase();
		List <Map<String,String>> confirmerList=service.selectAllConfirmer();
		
		mv.addObject("list", list);
		mv.addObject("confirmerList",confirmerList);
		mv.setViewName("admin/healthInfo/healthInfoMain");
		
		return mv;
	}
	
	@RequestMapping("admin/healthInfoPaging.do")
	public ModelAndView healthInfoPaging(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		
		int cPage;
		if(request.getParameter("cPage")==null) {
			cPage=1;
		}else {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}
			
		int numPerpage=5;
		
		//검색 필터
		String keyword=request.getParameter("keyword");
		if(keyword.equals("전체")) {
			keyword=null;
		}else {
			keyword=request.getParameter("keyword");
		}
		
		List <Map<String, String>> healthInfoAllList=service.selectAllHealthInfo(cPage, numPerpage, keyword);
		int totalCount=service.healthInfoCount(keyword);
		
		int totalPage=(int)Math.ceil((double)totalCount/numPerpage);		
		//ModelAndView객체에 데이터 저장하기
		//cPage:현재페이지 numPerPage:볼데이터수
		String pageBar="";//얘한테 누적시켜서 스트링으로 반환할것임
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
	
		if(pageNo==1) {

			pageBar += "<span><</span>";

		}
		else {

			pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+")' tabindex='-1'><</a>";
			
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
	
				pageBar+="<a href='javascript:fn_paging("+pageNo+")' tabindex='-1'>"+pageNo+"</a>";
		
			}else {
			
				pageBar+="<a href='javascript:fn_paging("+pageNo+")' tabindex='-1'>"+pageNo+"</a>";
			
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
		
			pageBar+="<a href='#' tabindex='-1'>></a>";
		
			
		}else {
			
			pageBar+="<a href='javascript:fn_paging("+pageNo+")'>></a>";
			
		}
		
		mv.addObject("cPage",cPage);
		mv.addObject("pageBar",pageBar);
		mv.addObject("totalPage",totalPage);		
		mv.addObject("count", totalCount);
		mv.addObject("healthInfoAllList", healthInfoAllList);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("admin/selectDisesaseCategory.do")
	public ModelAndView selectDisesaseCategory(DisesaseCategory dc) {
		ModelAndView mv=new ModelAndView();
		DisesaseCategory reDc=service.selectDisesaseCategory(dc);
		
		mv.addObject("dc", reDc);
		mv.setViewName("jsonView");
		
		return mv;
	}

	@RequestMapping("admin/selectConfirmer.do")
	public ModelAndView selectConfirmer(Confirmer c) {
		ModelAndView mv=new ModelAndView();
		Confirmer rec=service.selectConfirmer(c);
		mv.addObject("c", rec);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("admin/healthInfoWrite.do")
	public ModelAndView healthInfoWrite(MultipartFile[] upFile, ModelAndView mv,
			HttpSession session, DisesaseCategory dc, Confirmer c, HealthInformation hi, HealthInfoContentPic hicp) {
		
		System.out.println(dc);
		System.out.println(c);
		System.out.println(hi);
		System.out.println(hicp);
		
		return mv;
	}
	
}
