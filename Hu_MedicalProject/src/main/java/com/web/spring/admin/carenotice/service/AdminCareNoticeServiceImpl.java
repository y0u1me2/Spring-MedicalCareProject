package com.web.spring.admin.carenotice.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.admin.carenotice.dao.AdminCareNoticeDao;
import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareNotice;

@Service
public class AdminCareNoticeServiceImpl implements AdminCareNoticeService {
	
	@Autowired
	private AdminCareNoticeDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
//게시판리스트====================================================================
	
		@Override
		public List<CareNotice> careNotice(int cPage, int numPerPage) {
			
			List<CareNotice> list = dao.careNotice(session,cPage,numPerPage);

			return list;
		}

//게시판카운트======================================================================
		
		@Override
		public int careCount() {
			
			int result = dao.careCount(session);
			
			return result;
		}

		
//오늘등록된 글 개수=====================================================================
		
		@Override
		public int todayCount() {
			
			int result = dao.todayCount(session);
			
			return result;
		}

		
//돌보미 승인페이지 이동=================================================================
		
		@Override
		public CareNotice careAnswerView(int no) {
			
			return dao.careAnswerView(session,no);
		}
		
		@Override
		public List<CareAttachment> selectCareFile(int no) {
			
			return dao.selectCareFile(session,no);
		}

//돌보미 승인하기===================================================================
		
		
		@Override
		public int careNoticeYes(int no) {
			
			return dao.careNoticeYes(session, no);
		}


//돌보미 삭제하기====================================================================
		
		@Override
		public int deleteCare(int no) {
		
			return dao.deleteCare(session, no);
		}
		
	
		
}
