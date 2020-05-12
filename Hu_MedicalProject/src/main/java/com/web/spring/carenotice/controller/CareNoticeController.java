package com.web.spring.carenotice.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.carenotice.model.service.CareNoticeService;
import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareComment;
import com.web.spring.carenotice.model.vo.CareNotice;
import com.web.spring.common.PageFactory;
import com.web.spring.member.model.vo.Member;

@Controller
@SessionAttributes(value= {"loginMember"})
public class CareNoticeController {

	@Autowired
	private CareNoticeService service;
	
	@Autowired
	private Logger logger;


//돌보미찾기 게시판 페이징처리=========================================================================

	@RequestMapping("/care/careNotice")
	public ModelAndView careNotice(@RequestParam(required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false, defaultValue = "5") int numPerpage, ModelAndView mv) {

		List<CareNotice> list = service.careNotice(cPage, numPerpage);
		int totalCount = service.careCount();

		mv.addObject("list", list);
		mv.addObject("count", totalCount);
		mv.addObject("pageBar", PageFactory.getPage(totalCount, cPage, numPerpage, "/spring/care/careNotice"));
		mv.setViewName("client/careNotice/careNotice");
		return mv;
	}

//돌보미 등록 페이지로 이동===============================================================================
	@RequestMapping("/care/careEnroll")
	public String careEnroll() {

		return "client/careNotice/careEnroll";
	}


//돌보미 글 등록하기=======================================================================
	
	@RequestMapping("/care/careEnrollEnd")
	public ModelAndView insertCare(@RequestParam Map<String,String> param,
									MultipartFile[] upFile, ModelAndView mv, HttpSession session) {
	
		
		//파일업로드 처리하기
		String path = session.getServletContext().getRealPath("/resources/upload/careNotice");
		
		List<CareAttachment> files = new ArrayList();
		
		File f = new File(path);
		
		//폴더가 없으면 생성하기
		if(f.exists()) f.mkdirs();
		
		//파일 저장로직 구현 - 파일 rename처리
		for(MultipartFile mf : upFile) {
			if(!mf.isEmpty()) {
				//파일명생성
				String oriName = mf.getOriginalFilename();
				String ext = oriName.substring(oriName.lastIndexOf("."));//확장자 자르기
				
				//리네임 규칙설정
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				
				int rnd = (int)(Math.random()*1000);
				
				String rename = sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				
				try {
					//파일저장
					mf.transferTo(new File(f+"/"+rename));
				}catch(Exception e) {
					e.printStackTrace();
				}
				CareAttachment a = new CareAttachment();
				a.setOriginalFilename(oriName);
				a.setRenamedFilename(rename);
				files.add(a);
			}
		}
		int result = 0;
		
		try {
			result = service.insertCare(param,files);
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			//업로드 실패시 업로드된 파일 지우기
			for(CareAttachment a : files) {
				File delF = new File(path+"/"+a.getRenamedFilename());
				if(delF.exists()) {
					delF.delete();
				}
			}
		}
		
		String msg = "";
		String loc = "";
				
		if(result>0) {
			msg="돌보미 등록이 성공하였습니다.";
			loc="/care/careNotice";
		}else {
			msg="돌보미 등록이 실패하였습니다.";
			loc="/care/careEnroll";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("client/common/msg");
		
		return mv;
	}
	
//돌보미글 상세페이지로 이동============================================

	@RequestMapping("/care/careView")
	public ModelAndView careView(@RequestParam("cno") int cno, ModelAndView mv) {
	
		CareNotice c = service.careView(cno);
		
		List<CareAttachment> files = service.selectCareFile(cno);
		
		mv.addObject("c", c);
		mv.addObject("files",files);
		mv.setViewName("client/careNotice/careView");
	
		return mv;
	}

//파일다운로드========================================================
	
	   @RequestMapping("/care/fileDownload")
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
	
	
//돌보미글 수정페이지로 이동============================================
	@RequestMapping("/care/updateView")
	public ModelAndView updateView(ModelAndView mv,@RequestParam("no") int no) {

		CareNotice c = service.updateView(no);
		
		List<CareAttachment> files = service.updateViewFile(no);
						
		mv.addObject("c",c);
		mv.addObject("files",files);

		mv.setViewName("client/careNotice/careUpdate");
		return mv;
	}
	
	
//돌보미글 수정하기=================================================
	
	
	  @RequestMapping("/care/update.do") 
	  public String updateCare(Model model,@RequestParam Map<String,String> param, 
	  MultipartFile[] upFile, HttpSession session, HttpServletRequest request,@RequestParam(value="no") int no) {
	  

	  //파일업로드 처리하기 
		  String path = session.getServletContext().getRealPath("/resources/upload/careNotice");
	  
	  List<CareAttachment> files = new ArrayList();
	  
	  File f = new File(path);
	 
	  //폴더가 없으면 생성하기 
	  if(f.exists()) f.mkdirs();
	  
	 //파일 저장로직 구현 - 파일 rename처리 
	  for(MultipartFile mf : upFile) {
		  if(!mf.isEmpty()){ //파일명생성 
			  String oriName = mf.getOriginalFilename(); 
			  String ext = oriName.substring(oriName.lastIndexOf("."));//확장자 자르기
			  
			  	
			  	String orifile = request.getParameter("orifile");
			  	logger.debug(""+orifile);
				File deleteFile = new File(path+"/"+orifile);
				boolean flag = deleteFile.delete();
	  
				 //리네임 규칙설정 
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				  
				 int rnd = (int)(Math.random()*1000);
				  
				 String rename = sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				  
			  try { //파일저장
				mf.transferTo(new File(f+"/"+rename)); 
				}catch(Exception e) {
			  e.printStackTrace();
			  }
				  CareAttachment a = new CareAttachment();
				  a.setOriginalFilename(oriName); 
				  a.setRenamedFilename(rename); 
				  files.add(a); 
				  }
	  	} 
	  
	  int result = 0;
	  
	  try { 
		  result = service.updateCare(param,files,no);
	  
	  }catch(RuntimeException e) { 
		  e.printStackTrace(); 
		  //업로드 실패시 업로드된 파일 지우기
	  for(CareAttachment a : files) {
		  File delF = new File(path+"/"+a.getRenamedFilename()); 
		  if(delF.exists()) { 
			  delF.delete(); 
			  }
		  }
	   		
	  
	  } 
	  
	  String msg=""; String loc="";
	  
	  if(result>0) {
		  msg="수정되었습니다."; 
		  loc="/care/careNotice"; 
		  }else {
	  
	  msg="수정이 실패하였습니다."; 
	  loc="/care/updateView?no="+no; 
	  } 
	  model.addAttribute("msg",msg);
	  model.addAttribute("loc",loc); 
	  
	  return "client/common/msg";
	  
	  }
	 
	 
 //돌보미글 삭제하기================================================
	  
	  @RequestMapping("/care/delete.do") 
	  public String deleteCare(@RequestParam(value="no") int no,Model model) {
	  
	  int result=service.deleteCare(no); 
	  
	  logger.debug(""+no);
	  
	  String msg=""; 
	  String loc="";
	 
	  if(result>0) { 
		  msg="삭제되었습니다."; 
		  loc="/care/careNotice"; 
		  
	  }else {
		  msg="삭제를 실패하였습니다."; 
		  loc="/care/updateView"; 
	  } 
	  
	  model.addAttribute("msg",msg);
	  model.addAttribute("loc",loc); 
	  
	  return "client/common/msg"; 
	  
	  }

//댓글달기======================================  		  
	 
	@RequestMapping("/care/commentEnd")
	public String insertComment(CareComment c, Model m, @RequestParam("cno") int cno) {
			
		int result=service.insertComment(c);
		
		String msg="";
		String loc="/care/careView?cno="+cno;
			
		if(result>0) {
				msg="댓글이 등록되었습니다.";	
			}else {
				msg="등록을 실패하였습니다.";
			}
		
			m.addAttribute("msg",msg);
			m.addAttribute("loc",loc);
			return "client/common/msg";
		}
	
//댓글 목록 불러오기=================================
	
	@RequestMapping("/care/commentList")
	public ModelAndView commentList(@RequestParam int no, ModelAndView mv) {
		
		List<CareComment> list = service.commentList(no);
		
		
		mv.addObject("list",list);
		
		mv.setViewName("client/careNotice/careView");
				
		return mv;
	}
}
