package com.web.spring.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.notice.model.vo.Notice;

public interface NoticeDao {

	List<Notice> notice(SqlSessionTemplate session,int cPage,int numPerpage);

	int noticeCount(SqlSessionTemplate session);

	Notice noticeView(SqlSessionTemplate session, int no);

	 
}
