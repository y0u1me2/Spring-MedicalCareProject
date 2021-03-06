package com.web.spring.notice.controller;

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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.common.PageFactory;
import com.web.spring.notice.model.service.NoticeService;
import com.web.spring.notice.model.vo.Notice;
import com.web.spring.notice.model.vo.NoticeAttachment;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@Autowired
	private Logger logger;

/////////공지사항 페이지 ///////////
	@RequestMapping("/notice/noticeList")
	public ModelAndView noticeList(@RequestParam(required=false, defaultValue="1") int cPage, 
								   @RequestParam(required=false, defaultValue="5") int numPerpage,
								   ModelAndView mv,HttpServletRequest request) {
		List<Notice> list = service.notice(cPage,numPerpage);
		int totalCount = service.noticeCount();
		
		mv.addObject("list",list);
		mv.addObject("count",totalCount);

		mv.addObject("pageBar",PageFactory.getPage(totalCount, cPage, numPerpage, request.getContextPath()+"/notice/noticeList"));
		mv.setViewName("client/notice/noticeList");
		return mv;
	}
/////////공지사항 상세 화면 ///////////
	@RequestMapping("/notice/noticeView")
	public ModelAndView noticeView(ModelAndView mv, @RequestParam("no") int no){
		
		Notice notice = service.noticeView(no);
		List<NoticeAttachment> files=service.selectNoticeFile(no);
		
		mv.addObject("notice",notice);
		mv.addObject("files",files);
		mv.setViewName("client/notice/noticeView");
		
		return mv;
	}
/////////공지사항 작성 페이지 이동 ///////////	
	@RequestMapping("/notice/noticeInsert")
	public String noticeWrite() {
		return "client/notice/noticeWrite";
	}
/////////공지사항 작성 ///////////
	@RequestMapping("/notice/noticeInsertEnd") 
	public ModelAndView noticeInsert(@RequestParam Map<String,String> param,
								 	 MultipartFile[] noticeUpFile, ModelAndView mv, 
									 HttpSession session) { 
	
		//파일업로드 처리하기
		String path = session.getServletContext().getRealPath("/resources/upload/notice");
		
		List<NoticeAttachment> fileNames = new ArrayList();
		
		File f = new File(path);
		
		//폴더가 없으면 생성하기
		if(f.exists()) f.mkdirs();
	
		//파일 저장로직 구현 - 파일 rename 처리
		for(MultipartFile mf : noticeUpFile) {
			if(!mf.isEmpty()) {
				//파일명생성
				String oriName = mf.getOriginalFilename();
				String ext = oriName.substring(oriName.lastIndexOf("."));
				//리네임 규칙 설정
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
				int rnd = (int)(Math.random()*1000);
				String rename = sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				try {
					//파일 저장
					mf.transferTo(new File(f+"/"+rename));//파일을 생성해주는 아이
				}catch(Exception e) {
					e.printStackTrace();
				}
				NoticeAttachment a = new NoticeAttachment();
				a.setOriginalFilename(oriName);
				a.setRenamedFilename(rename);
				fileNames.add(a);
			}
		}
		int result = 0;
		
		try {
			result = service.noticeInsert(param,fileNames);
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			//업로드 실패시 업로드된 파일 지우기
			for(NoticeAttachment a : fileNames) {
				File delF = new File(path+"/"+a.getRenamedFilename());
				if(delF.exists()) {
					delF.delete();
				}
			}
		}
		
		String msg = "";
		String loc = "";
				
		if(result>0) {
			msg="공지사항 등록이 성공하였습니다.";
			loc="/notice/noticeList";
		}else {
			msg="공지사항 등록이 실패하였습니다.";
			loc="/notice/noticeInsert";
		}
		mv.setViewName("client/common/msg");
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
	
		return mv;
	}
/////////공지사항 파일 다운 ///////////
	@RequestMapping("/notice/fileDownload")
	public void fileDownLoad(String rName, String oName,
			HttpServletResponse response,HttpSession session,
			HttpServletRequest request) {
		BufferedInputStream bis=null;
		ServletOutputStream sos=null;
		
		String dir=session.getServletContext().getRealPath("/resources/upload/notice");
		File f=new File(dir+"/"+rName);
		
		try {
			FileInputStream fis=new FileInputStream(f);
			bis=new BufferedInputStream(fis);
			sos=response.getOutputStream();
			//오리지날 파일명으로 전송
			String oriName="";
			boolean isMSIE=request.getHeader("user-agent").indexOf("MSIE")!=-1||
					request.getHeader("user-agent").indexOf("Trident")!=-1;
			if(isMSIE) {
				oriName=URLEncoder.encode(oName,"UTF-8");
				oriName=oriName.replaceAll("\\+", "%20");
			}else {
				oriName=new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			response.setContentType("application/otect-stream;charset=UTF-8");
			response.addHeader("Content-Disposition", "noticeAttachment;filename=\""+oriName+"\"");
			response.setContentLength((int)f.length());
			
			int read=0;
			while((read=bis.read())!=-1) {
				sos.write(read);
			}
		
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				sos.close();
				bis.close();
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
/////////공지사항 삭제 ///////////
	@RequestMapping("/notice/noticeDelete")
	 public String noticeDelete(@RequestParam(value="no") int no,Model model) {
	  
	  int result=service.noticeDelete(no); 
	  
	  logger.debug(""+no);
	  
	  String msg=""; 
	  String loc="";
	 
	  if(result>0) { 
		  msg="삭제되었습니다."; 
		  loc="/notice/noticeList"; 
		  
	  }else {
		  msg="삭제를 실패하였습니다."; 
		  loc="/notice/noticeView"; 
	  } 
	  
	  model.addAttribute("msg",msg);
	  model.addAttribute("loc",loc); 
	  
	  return "client/common/msg"; 
	  
	  }
/////////공지사항 수정 페이지 이동 ///////////
	@RequestMapping("/notice/noticeUpdate")
	public ModelAndView noticeUpdate(ModelAndView mv,@RequestParam("no") int no) {
		Notice notice = service.noticeUpdate(no);
		List<NoticeAttachment> files = service.noticeUpdateFile(no);
		
		mv.addObject("notice",notice);
		mv.addObject("files",files);

		mv.setViewName("client/notice/noticeUpdate");
		return mv;
	}
/////////공지사항 수정하기 ///////////
	@RequestMapping("/notice/noticeUpdateEnd")
	public String noticeUpdateEnd(Model model,@RequestParam Map<String,String> param, 
		  MultipartFile[] upFile, HttpSession session, HttpServletRequest request,@RequestParam(value="no") int no) {
		  

		  //파일업로드 처리하기 
		  String path = session.getServletContext().getRealPath("/resources/upload/notice");
		  
		  List<NoticeAttachment> files = new ArrayList();
		  
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
				  	  NoticeAttachment a = new NoticeAttachment();
					  a.setOriginalFilename(oriName); 
					  a.setRenamedFilename(rename); 
					  files.add(a); 
					  }
		  	} 
		  
		  int result = 0;
		  
		  try { 
			  result = service.noticeUpdateEnd(param,files,no);
		  
		  }catch(RuntimeException e) { 
			  e.printStackTrace(); 
			  //업로드 실패시 업로드된 파일 지우기
		  for(NoticeAttachment a : files) {
			  File delF = new File(path+"/"+a.getRenamedFilename()); 
			  if(delF.exists()) { 
				  delF.delete(); 
				  }
			  }
		   		
		  
		  } 
		  
		  String msg=""; String loc="";
		  
		  if(result>0) {
			  msg="수정되었습니다."; 
			  loc="/notice/noticeList"; 
			  }else {
		  
		  msg="수정이 실패하였습니다."; 
		  loc="/notice/noticeUpdate?no="+no; 
		  } 
		  model.addAttribute("msg",msg);
		  model.addAttribute("loc",loc); 
		  
		  return "client/common/msg";
		  
	}
//게시글 제목으로 검색하기
	@RequestMapping("/notice/search.do")
	public ModelAndView searchNotice(@RequestParam(value="searchContent",required=false) String searchContent,
									  @RequestParam(value="keyword",required=false) String keyword,
									  ModelAndView mv) {
		
		Map<String,String> param = new HashMap<String,String>();
		param.put("searchContent",searchContent);
		param.put("keyword",keyword);
		
		List<Map<String,String>> list = service.searchNotice(param);
		
		mv.addObject("list",list);
		mv.setViewName("client/notice/noticeList");

		return mv;
	}
}
