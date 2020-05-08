package com.web.spring.carenotice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareComment;
import com.web.spring.carenotice.model.vo.CareNotice;


@Repository
public class CareNoticeDaoImpl implements CareNoticeDao {
	
	//돌보미 리스트 페이징처리
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

	//돌보미 글 등록
	@Override
	public int insertCare(SqlSession session, Map<String, String> param) {
		
		return session.insert("care.insertCare",param);
	}

	@Override
	public int insertCareAttachment(SqlSession session, CareAttachment a) {
	
		return session.insert("care.insertAttachment",a);
	}
	
	//돌보미상세 페이지
	@Override
	public CareNotice careView(SqlSession session, int cno) {
	
		return session.selectOne("care.careView",cno);
	}

	@Override
	public List<CareAttachment> selectCareFile(SqlSession session, int cno) {
	
		return session.selectList("care.selectCareFile",cno);
	}
	
	//게시글 수정페이지 이동
	@Override
	public CareNotice updateView(SqlSession session, int no) {
		
		return session.selectOne("care.updateView",no);
	}

	
	//게시글 삭제하기
	@Override
	public int deleteCare(SqlSession session, int no) {
		
		return session.update("care.deleteCare",no);
	}
	
	//게시글 수정하기
	@Override
	public int updateCare(SqlSession session, CareNotice c) {
		
		return session.update("care.updateCare",c);
	}


	
	//updateAttachment
	
	//댓글 달기
	@Override
	public int insertComment(SqlSession session, CareComment c) {
		
		return session.insert("care.insertComment",c);
	}

	//댓글 리스트
	@Override
	public List<CareComment> commentList(SqlSession session, int no) {
		
		return session.selectList("care.commentList",no);
	}
	
	
	
	
	
	
	
}
