package com.web.spring.carenotice.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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

	
	
	
//검색어로 조회========================================================================================
	@RequestMapping("/care/search.do")
	public ModelAndView searchContent(@RequestParam(value="searchContent",required=false) String searchContent,
			@RequestParam(value="keyword",required=false) String keyword,ModelAndView mv) {
		
		Map<String,String> param = new HashMap<String,String>();
		param.put("searchContent",searchContent);
		param.put("keyword",keyword);
		
		List<Map<String,String>> list = service.searchContent(param);
		
		mv.addObject("list",list);
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
	public ModelAndView careView(HttpServletRequest request, HttpServletResponse response,
			ModelMap m,@RequestParam("no") int no, ModelAndView mv) {
	
		
		//쿠키로 작성자 검사
		Cookie[] cookies=request.getCookies();
		String val="";
		boolean hasRead=false;
				
		//쿠키가 있는지 없는지 확인(읽었는지 안읽었는지)
		if(cookies!=null) {
			for(Cookie cook : cookies) {
				String name = cook.getName();
				String v=cook.getValue();
					if("careView".equals(name)) {
					val=v;
					
					if(v.contains("|"+no+"|")) {
						hasRead=true;
						break;
							}
						}
					}
				}
		//안읽엇으면
		if(!hasRead) {
			Cookie cook = new Cookie("careView","|"+no+"|");
			cook.setMaxAge(-1);
			response.addCookie(cook);
		}
		
		CareNotice c = service.careView(no,hasRead);
		
		List<CareAttachment> files = service.selectCareFile(no);
			
		int count = service.commentCount(no);
		
		mv.addObject("cnt",count);
		mv.addObject("c", c);
		mv.addObject("files",files);
		mv.setViewName("client/careNotice/careView");
	
		return mv;
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
	public String insertComment(CareComment c, Model m, @RequestParam("no") int no) {
					
		int result = service.insertComment(c);
		
		String msg="";
		String loc="/care/careView?no="+no;
			
		if(result>0) {
				msg="댓글이 등록되었습니다.";	
			}else {
				msg="등록을 실패하였습니다.";
			}
		
			m.addAttribute("msg",msg);
			m.addAttribute("loc",loc);
			return "client/common/msg";
		}

//대댓글 달기====================================
	@RequestMapping("/care/commentEndEnd")
	public String insertComment2(CareComment c, Model m, @RequestParam("no") int no) {
		
		logger.debug("오니?==================="+no);
		
		int result = service.insertComment2(c);
		
		String msg="";
		String loc="/care/careView?no="+no;
			
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
		
		mv.setViewName("client/careNotice/careViewComment");
				
		return mv;
	}
	
//댓글 삭제=====================================
	
	@RequestMapping("/care/replydelete")
	 public String replydelete(@RequestParam(value="no") int no,@RequestParam(value="cno") int cno ,Model model) {
		
		logger.debug(""+no);
		
		 int result = service.replydelete(no); 
		  
		  
		  String msg=""; 
		  String loc="/care/careView?no="+cno;
		 
		  if(result>0) { 
			  msg="댓글이 삭제 되었습니다."; 
			  
		  }else {
			  msg="삭제를 실패하였습니다."; 
		  } 
		  
		  model.addAttribute("msg",msg);
		  model.addAttribute("loc",loc); 
		  
		  return "client/common/msg"; 
		  
		  }


}
