package com.web.spring.admin.carenotice.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.admin.carenotice.service.AdminCareNoticeService;
import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareNotice;
import com.web.spring.common.PageFactory2;

@Controller
public class AdminCareNotice {

@Autowired
	private AdminCareNoticeService service;
	
//돌보미 등록 관리 페이지 이동 / 페이징처리 ======================================
@RequestMapping("/admin/careNotice.do")
	public ModelAndView adminCareNotice(@RequestParam(required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false, defaultValue = "5") int numPerpage, ModelAndView mv) {

		List<CareNotice> list = service.careNotice(cPage, numPerpage);
		int totalCount = service.careCount();
		int todayCount = service.todayCount();

		mv.addObject("list", list);
		mv.addObject("count", totalCount);
		mv.addObject("today",todayCount);
		mv.addObject("pageBar", PageFactory2.getPage(totalCount, cPage, numPerpage, "/spring/admin/careNotice.do"));
		mv.setViewName("admin/careNotice/careNoticeList");
		return mv;	
}

//돌보미 등록 승인하기 페이지로 이동 =============================================
@RequestMapping("/admin/careAnswerView")
	public ModelAndView careAnwerView(@RequestParam("no") int no, ModelAndView mv) {
		
		CareNotice c = service.careAnswerView(no);
		
		List<CareAttachment> files = service.selectCareFile(no);
		
		
		mv.addObject("c", c);
		mv.addObject("files",files);
		mv.setViewName("admin/careNotice/careAnswerBefore");
	
		return mv;
	}
			
//돌보미 등록 자격증 다운로드=================================================
@RequestMapping("/admin/fileDownload")
public void fileDownLoad(String rName, String oName,
                  HttpServletResponse response,HttpSession session,
                  HttpServletRequest request) {
   
	   //입출력을 하기 위해 스트림만들기->먼저선언하는이유->IOException 없어서 직접 비워주고 채워줘야하기때문
   BufferedInputStream bis=null;
   ServletOutputStream sos=null;
   
   String dir=session.getServletContext().getRealPath("/resources/upload/careNotice");
   File f=new File(dir+"/"+rName);//파일불러오기
   
   try {
      FileInputStream fis=new FileInputStream(f);
      bis=new BufferedInputStream(fis);
      sos=response.getOutputStream();
      
      //오리지날 파일명으로 전송!
      String oriName="";
      boolean  isMSIE=request.getHeader("user-agent").indexOf("MSIE")!=-1||
            request.getHeader("user-agent").indexOf("Trident")!=-1;//익스플로러처리
      if(isMSIE) {
         oriName=URLEncoder.encode(oName,"UTF-8");
         oriName=oriName.replaceAll("\\+", "%20");
      }else {
         oriName=new String(oName.getBytes("UTF-8"),"ISO-8859-1");
      }
      response.setContentType("application/otect-stream;charset=UTF-8");
      //불특정한 파일(확장자 모름)otect-stream
      response.addHeader("Content-Disposition", "attachment;filename=\""+oriName+"\"");
      response.setContentLength((int)f.length() );
      int read=0;
      while((read=bis.read())!=-1) {
         sos.write(read);
      }
   }catch(IOException e){
      e.printStackTrace();
   }finally {
      try {
         sos.close();
         bis.close();
      }catch(IOException e) {
         e.printStackTrace();
      }
   }
}
		
//돌보미 등록 승인하기======================================================
	@RequestMapping("/admin/careNoticeYes")
	public String careNoticeYes(Model m,@RequestParam("no") int no) {
		
		int result = service.careNoticeYes(no);
		
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="승인완료 되었습니다.";
			loc="/admin/careNotice.do";
		}else {
			msg="승인이 실패하였습니다.";
			loc="/admin/careAnswerView?no="+no;
		}
		
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "admin/common/msg";
	}


//돌보미 글 삭제===============================================
	@RequestMapping("/admin/CheckDelete")
	 public String deleteCare(@RequestParam(value="no") int no,Model m) {
		  
		
		int result = service.deleteCare(no);	
		  	  
		  String msg=""; 
		  String loc="/admin/careNotice.do";
		 
		  if(result>0) { 
			  msg="삭제 되었습니다."; 			
			  
		  }else {
			  msg="삭제 실패하였습니다."; 			
		  } 
		  
		  
		  m.addAttribute("msg", msg);
		  m.addAttribute("loc",loc); 
		  
		  return "admin/common/msg"; 
		
			
			
				
				
		
	
}


}

