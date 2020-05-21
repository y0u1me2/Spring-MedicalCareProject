package com.web.spring.admin.healthInfo.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.web.spring.carenotice.model.vo.CareAttachment;
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
	
	@RequestMapping("admin/disesaseForm.do")
	public ModelAndView disesaseForm(MultipartFile upFile, ModelAndView mv,
			HttpSession session, DisesaseCategory dc) {
		
		System.out.println(upFile);
		System.out.println(dc);
		
		//파일업로드 처리하기
		//경로설정
		//세부경로
		String details="";
		switch(dc.getDisesaseNo()) {
			case "D1" : details="cold/"; break;
			case "D2" : details="coldWave/"; break;
			case "D3" : details="diarrhea/"; break;
			case "D4" : details="bronchiectasis/"; break;
			case "D5" : details="helminth/"; break;
			case "D6" : details="malaria/"; break;
			case "D7" : details="childrenVision/"; break;
			case "D8" : details="epilepsy/"; break;
			case "D9" : details="stroke/"; break;
			case "D10" : details="meningitis/"; break;
			case "D11" : details="glaucoma/"; break;
			case "D12" : details="wrinkle/"; break;
			default : details=dc.getDisesaseTitle()+"/"; break;
		}
		if(dc.getDisesaseNo()==null) {
			String path = session.getServletContext().getRealPath("/resources/images");		
	//		List<CareAttachment> files = new ArrayList();
			File f = new File(path);				
	//		//폴더가 없으면 생성하기
			if(f.exists()) f.mkdirs();		
	//		//파일 저장로직 구현 - 파일 rename처리
			if(!upFile.isEmpty()) {
	//			//파일명생성
				String oriName = upFile.getOriginalFilename();
				String ext = oriName.substring(oriName.lastIndexOf("."));//확장자 자르기				
	//			//리네임 규칙설정
	//										
				String rename = "/healthInformation"+details+dc.getDisesaseTitle()+ext;						
				try {
	//				//파일저장
					upFile.transferTo(new File(f+"/"+rename));
				}catch(Exception e) {
					e.printStackTrace();
				}
					
				dc.setDisesaseFile(rename);
					
				System.out.println(rename);
				System.out.println(oriName);
			}
			int result = 0;
			try {
				result = service.insertDisesase(dc);			
			}catch(RuntimeException e) {
				e.printStackTrace();
				//업로드 실패시 업로드된 파일 지우기
	//			for(CareAttachment a : files) {
	//				File delF = new File(path+"/"+a.getRenamedFilename());
	//				if(delF.exists()) {
	//					delF.delete();
	//				}
	//			}
		}
		System.out.println(result);
//		String msg = "";
//		String loc = "";
//						
//		if(result>0) {
//			msg="돌보미 등록이 성공하였습니다.";
//			loc="/care/careNotice";
//		}else {
//			msg="돌보미 등록이 실패하였습니다.";
//			loc="/care/careEnroll";
//		}
//				
//		mv.addObject("msg",msg);
//		mv.addObject("loc",loc);
		}
		mv.setViewName("jsonView");
				
		return mv;
	}
	
	
	@RequestMapping("admin/confirmerForm.do")
	public ModelAndView confirmerForm(MultipartFile[] upFile, ModelAndView mv,
			HttpSession session, Confirmer c) {
		
		System.out.println(c);
		
		return mv;
	}
	
	@RequestMapping("admin/healthInfoForm.do")
	public ModelAndView healthInfoForm(MultipartFile[] upFile, ModelAndView mv,
			HttpSession session, HealthInformation hi, HealthInfoContentPic hicp) {
				
		System.out.println(hi);
		System.out.println(hicp);
		
		return mv;
	}
}
