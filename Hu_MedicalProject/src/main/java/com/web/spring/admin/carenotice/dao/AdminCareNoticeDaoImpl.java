package com.web.spring.admin.carenotice.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareNotice;

@Repository
public class AdminCareNoticeDaoImpl implements AdminCareNoticeDao {
	
	//페이징처리
	@Override
	public List<CareNotice> careNotice(SqlSession session, int cPage, int numPerPage) {
	
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return session.selectList("care.adminCareNotice",null,row);
	}
	
	//총 개수
	@Override
	public int careCount(SqlSession session) {
		
		return session.selectOne("care.careCount");
	}

	
	//오늘 등록된 글 개수
	@Override
	public int todayCount(SqlSession session) {
		
		return session.selectOne("care.todayCount");
	}

	
	//돌보미 승인페이지 이동
	@Override
	public CareNotice careAnswerView(SqlSession session, int no) {
		
		return session.selectOne("care.careAnswerView",no);
	}
	
	@Override
	public List<CareAttachment> selectCareFile(SqlSession session, int no) {
	
		return session.selectList("care.selectCareFile2",no);
	}

	
	//돌보미 승인하기
	@Override
	public int careNoticeYes(SqlSession session, int no) {
		
		return session.update("care.careNoticeYes",no);
	}

	
	//삭제하기
	@Override
	public int deleteCare(SqlSession session, int no) {

		return session.update("care.deleteCare2",no);
	}
	
	

	
}

