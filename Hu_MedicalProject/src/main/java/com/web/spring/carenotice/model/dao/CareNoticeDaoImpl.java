package com.web.spring.carenotice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareNotice;


@Repository
public class CareNoticeDaoImpl implements CareNoticeDao {

	@Override	
	public List<CareNotice> careNotice(SqlSession session, int cPage, int numPerPage) {
		
		//paging처리를 위한 작업
		//마이바티스에서 제공하는 RowBounds 객체를 이용!
		//객체를 생성해서 값을 넣어주면됨 -> 매개변수 있는 생성자를 이용
		//매개변수 -> offset, limit
		//offset : 몇개의 자료를 가져올지 -> 시작페이지
		//limit : 한페이지당 게시물 수 -> numPerPage
		
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return session.selectList("care.careNotice",null,row);
	}

	@Override
	public int careCount(SqlSession session) {
		
		return session.selectOne("care.careCount");
	}

	@Override
	public int insertCare(SqlSession session, Map<String, String> param) {
		
		return session.insert("care.inserCare",param);
	}

	@Override
	public int insertCareAttachment(SqlSession session, CareAttachment a) {
	
		return session.insert("care.insertAttachment");
	}

	@Override
	public CareNotice careView(SqlSession session, int cno) {
	
		return session.selectOne("care.careView",cno);
	}

	@Override
	public List<CareAttachment> selectCareFile(SqlSession session, int cno) {
	
		return session.selectList("care.selectCareFile",cno);
	}
	

	
	
	
	
	
	
	
	
}
