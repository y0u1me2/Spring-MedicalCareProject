package com.web.spring.carenotice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareNotice;


public interface CareNoticeDao {

	List<CareNotice> careNotice(SqlSession session,int cPage,int numPerPage);
	int careCount(SqlSession session);

	int insertCare(SqlSession session, Map<String,String> param);
	int insertCareAttachment(SqlSession session, CareAttachment a);

	CareNotice careView(SqlSession session,int cno);
	List<CareAttachment> selectCareFile(SqlSession session, int cno); 
}
