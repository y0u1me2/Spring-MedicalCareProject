package com.web.spring.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.notice.model.vo.Notice;
import com.web.spring.notice.model.vo.NoticeAttachment;

public interface NoticeDao {

	List<Notice> notice(SqlSessionTemplate session,int cPage,int numPerpage);

	int noticeCount(SqlSessionTemplate session);

	Notice noticeView(SqlSessionTemplate session, int no);

	int noticeInsert(SqlSessionTemplate session, Map<String, String> param);

	int insertNoticeAttachment(SqlSessionTemplate session, NoticeAttachment a);

	List<NoticeAttachment> selectNoticeFile(SqlSessionTemplate session, int no);

	int noticeDelete(SqlSessionTemplate session, int no);

	 
}
