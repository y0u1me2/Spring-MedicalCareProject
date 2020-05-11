package com.web.spring.notice.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.notice.model.dao.NoticeDao;
import com.web.spring.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Notice> notice(int cPage,int numPerpage) {
		return dao.notice(session,cPage,numPerpage);
	}

	@Override
	public int noticeCount() {
		return dao.noticeCount(session);
	}

	
	
}
