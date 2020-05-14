package com.web.spring.admin.carenotice.service;

import java.util.List;

import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareNotice;

public interface AdminCareNoticeService {

	//게시글 리스트
	List<CareNotice> careNotice(int cPage,int numPerPage);
			
	//게시글 전체 개수
	int careCount();
	
	//오늘등록된 글 개수
	int todayCount();
	
	//돌보미 승인하기 페이지 이동
	CareNotice careAnswerView(int no);
	List<CareAttachment> selectCareFile(int no);
	
	//승인하기
	int careNoticeYes(int no);
	
	//삭제하기
	int deleteCare(int no);
	
}
