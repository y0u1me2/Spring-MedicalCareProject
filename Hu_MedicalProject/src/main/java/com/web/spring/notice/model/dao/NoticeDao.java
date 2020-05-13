package com.web.spring.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.notice.model.vo.Notice;
import com.web.spring.notice.model.vo.NoticeAttachment;

public interface NoticeDao {

/////////공지사항 페이지 ///////////
	List<Notice> notice(SqlSessionTemplate session,int cPage,int numPerpage);

/////////공지사항 개수 카운트 ///////////
	int noticeCount(SqlSessionTemplate session);

/////////공지사항 상세 화면 ///////////
	Notice noticeView(SqlSessionTemplate session, int no);
	List<NoticeAttachment> selectNoticeFile(SqlSessionTemplate session, int no);

/////////공지사항 작성 ///////////
	int noticeInsert(SqlSessionTemplate session, Map<String, String> param);
	int insertNoticeAttachment(SqlSessionTemplate session, NoticeAttachment a);

/////////공지사항 삭제 ///////////	
	int noticeDelete(SqlSessionTemplate session, int no);

/////////공지사항 수정 페이지 이동 ///////////
	Notice noticeUpdate(SqlSessionTemplate session, int no);
	List<NoticeAttachment> noticeUpdateFile(SqlSessionTemplate session, int no);

/////////공지사항 수정하기 ///////////
	int noticeUpdateEnd(SqlSessionTemplate session, Map<String, String> param);
	int updateNoticeAttachment(SqlSessionTemplate session, NoticeAttachment a);

	 
}
