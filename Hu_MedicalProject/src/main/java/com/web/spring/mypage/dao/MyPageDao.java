package com.web.spring.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.web.spring.member.model.vo.Member;

public interface MyPageDao {

	Member passwordCheck(SqlSession session, Member m);
	
	int memberUpdate(SqlSession session, Member m);
	
	int deleteMember(SqlSession session, Member m);
	
	List<Map<String,String>> reservationStatus(SqlSession session, int no);
}
