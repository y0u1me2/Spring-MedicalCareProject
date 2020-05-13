package com.web.spring.notice.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.notice.model.dao.NoticeDao;
import com.web.spring.notice.model.vo.Notice;
import com.web.spring.notice.model.vo.NoticeAttachment;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private Logger logger;
	
	@Override
	public List<Notice> notice(int cPage,int numPerpage) {
		return dao.notice(session,cPage,numPerpage);
	}

	@Override
	public int noticeCount() {
		return dao.noticeCount(session);
	}

	@Override
	public Notice noticeView(int no) {
		return dao.noticeView(session,no);
	}

	@Override
	public int noticeInsert(Map<String, String> param, List<NoticeAttachment> fileNames) {
		int result = dao.noticeInsert(session,param);
		if(result==0) {//트랜젝션 처리 ->보류
			throw new RuntimeException();
		}
		logger.debug("pk값?"+param.get("boardNo"));
		if(!fileNames.isEmpty()) {
			for(NoticeAttachment a : fileNames) {
				a.setNoticeNo(Integer.parseInt(param.get("noticeNo")));
				dao.insertNoticeAttachment(session,a);
				if(result==0) { //트랜젝션
					throw new RuntimeException();
				}
			}
		}
		return result;
	}

	@Override
	public List<NoticeAttachment> selectNoticeFile(int no) {
		// TODO Auto-generated method stub
		return dao.selectNoticeFile(session,no);
	}

	@Override
	public int noticeDelete(int no) {
		// TODO Auto-generated method stub
		return dao.noticeDelete(session,no);
	}
	
	
}
