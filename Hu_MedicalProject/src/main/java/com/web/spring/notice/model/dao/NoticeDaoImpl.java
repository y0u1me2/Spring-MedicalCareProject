package com.web.spring.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.notice.model.vo.Notice;

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
	
}
