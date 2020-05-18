package com.web.spring.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.spring.member.model.vo.Member;

@Repository
public class MyPageDaoImpl implements MyPageDao {

	@Override
	public Member passwordCheck(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("myPage.passwordCheck",m);
	}

	@Override
	public List<Map<String, String>> reservationStatus(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("myPage.reservationStatus",no);
	}
	
	

}
