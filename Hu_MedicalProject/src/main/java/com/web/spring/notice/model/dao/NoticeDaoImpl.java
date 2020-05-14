package com.web.spring.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.notice.model.vo.Notice;
import com.web.spring.notice.model.vo.NoticeAttachment;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	
/////////공지사항 페이지 ///////////
	@Override
	public List<Notice> notice(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("notice.noticeList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
/////////공지사항 개수 카운트 ///////////
	@Override
	public int noticeCount(SqlSessionTemplate session) {
		return session.selectOne("notice.noticeCount");
	}
/////////공지사항 상세 화면 ///////////
	@Override
	public Notice noticeView(SqlSessionTemplate session, int no) {
		return session.selectOne("notice.noticeView",no);
	}
	@Override
	public List<NoticeAttachment> selectNoticeFile(SqlSessionTemplate session, int no) {
		return session.selectList("notice.selectNoticeFile",no);
	}
/////////공지사항 작성 ///////////
	@Override
	public int noticeInsert(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("notice.noticeInsert",param);
	}

	@Override
	public int insertNoticeAttachment(SqlSessionTemplate session, NoticeAttachment a) {
		return session.insert("notice.insertNoticeAttachment",a);
		
	}

/////////공지사항 삭제 ///////////	
	@Override
	public int noticeDelete(SqlSessionTemplate session, int no) {
		return session.update("notice.noticeDelete",no);
	}
/////////공지사항 수정 페이지 이동 ///////////
	@Override
	public Notice noticeUpdate(SqlSessionTemplate session, int no) {
		return session.selectOne("notice.noticeUpdate",no);
	}

	@Override
	public List<NoticeAttachment> noticeUpdateFile(SqlSessionTemplate session, int no) {
		return session.selectList("notice.noticeUpdateFile",no);
	}
/////////공지사항 수정하기 ///////////
	@Override
	public int noticeUpdateEnd(SqlSessionTemplate session, Map<String, String> param) {
		return session.update("notice.noticeUpdateEnd",param);
	}

	@Override
	public int updateNoticeAttachment(SqlSessionTemplate session, NoticeAttachment a) {
		return session.update("notice.updateNoticeAttachment",a);
	}
	
	
}
