package com.web.spring.carenotice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.carenotice.model.service.CareNoticeService;
import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareNotice;
import com.web.spring.common.PageFactory;

@Controller
public class CareNoticeController {

	@Autowired
	private CareNoticeService service;

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
		
		List<CareAttachment> fileNames = new ArrayList();
		
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
				fileNames.add(a);
			}
		}
		int result = 0;
		
		try {
			result = service.insertCare(param,fileNames);
		}catch(RuntimeException e) {
			e.printStackTrace();
			//업로드 실패시 업로드된 파일 지우기
			for(CareAttachment a : fileNames) {
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
		
		mv.setViewName("client/common/msg");
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		return mv;
	}
}
