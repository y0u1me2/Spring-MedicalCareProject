package com.web.spring.carenotice.model.service;

import java.util.List;
import java.util.Map;

import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareComment;
import com.web.spring.carenotice.model.vo.CareNotice;

public interface CareNoticeService {

		//게시글 리스트
		List<CareNotice> careNotice(int cPage,int numPerPage);
		
		//게시글 전체 개수
		int careCount();
		
		//게시글 작성
		int insertCare(Map<String,String> param, List<CareAttachment> files);
	 
	   //게시글 상세보기
		CareNotice careView(int cno);  
	   //게시글 첨부파일 가져오기 
		List<CareAttachment> selectCareFile(int cno);
		
		//게시글 수정화면 이동 
		CareNotice updateView(int no);
		List<CareAttachment> updateViewFile(int no);
	 
		//게시글 수정하기
		int updateCare(Map<String,String> param, List<CareAttachment> files,int no);
		
		//게시글 삭제하기
		int deleteCare(int no);
		
		//댓글 달기
		int insertComment(CareComment c);
		
		//댓글 리스트
		List<CareComment> commentList(int no);
}
