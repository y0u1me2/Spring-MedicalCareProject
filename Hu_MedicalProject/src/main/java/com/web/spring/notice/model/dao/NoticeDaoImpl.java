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

	

	@Override
	public List<Notice> notice(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("notice.noticeList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int noticeCount(SqlSessionTemplate session) {
		return session.selectOne("notice.noticeCount");
	}

	@Override
	public Notice noticeView(SqlSessionTemplate session, int no) {
		return session.selectOne("notice.noticeView",no);
	}

	@Override
	public int noticeInsert(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("notice.noticeInsert",param);
	}

	@Override
	public int insertNoticeAttachment(SqlSessionTemplate session, NoticeAttachment a) {
		return session.insert("notice.noticeAttachment",a);
		
	}

	@Override
	public List<NoticeAttachment> selectNoticeFile(SqlSessionTemplate session, int no) {
		return session.selectList("notice.selectNoticeFile",no);
	}

	@Override
	public int noticeDelete(SqlSessionTemplate session, int no) {
		return session.update("notice.noticeDelete",no);
	}
	
	
}
