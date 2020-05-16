package com.web.spring.mypage.dao;

import org.apache.ibatis.session.SqlSession;

import com.web.spring.member.model.vo.Member;

public interface MyPageDao {

	Member passwordCheck(SqlSession session, Member m);
	
}
