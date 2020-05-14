package com.web.spring.admin.carenotice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareNotice;

public interface AdminCareNoticeDao {
	
	List<CareNotice> careNotice(SqlSession session,int cPage,int numPerPage);
	int careCount(SqlSession session);
	int todayCount(SqlSession session);
	
	CareNotice careAnswerView(SqlSession session,int no);
	List<CareAttachment> selectCareFile(SqlSession session, int no); 
	
	int careNoticeYes(SqlSession session,int no);
	
	int deleteCare(SqlSession session,int no);
	
}
