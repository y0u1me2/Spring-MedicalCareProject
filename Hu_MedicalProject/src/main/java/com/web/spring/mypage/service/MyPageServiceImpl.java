package com.web.spring.mypage.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.member.model.vo.Member;
import com.web.spring.mypage.dao.MyPageDao;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDao dao;
	
	@Autowired
	private SqlSession session;
	
	//비밀번호 체크용
	@Override
	public Member passwordCheck(Member m) {
		// TODO Auto-generated method stub
		return dao.passwordCheck(session, m);
	}

	@Override
	public List<Map<String, String>> reservationStatus(int no) {
		// TODO Auto-generated method stub
		return dao.reservationStatus(session, no);
	}
	
	

}
