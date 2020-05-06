package com.web.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	
	@Override
	public int insertPerson(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertPerson",m);
	}

	@Override
	public Member memberLogin(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.memberLogin",m);
	}

	
	
	
}