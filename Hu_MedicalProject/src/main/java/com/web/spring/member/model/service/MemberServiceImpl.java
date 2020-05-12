package com.web.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.member.model.dao.MemberDao;
import com.web.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MemberDao dao;
	
	
	@Override
	public int insertPerson(Member m) {
		return dao.insertPerson(session,m);
	}


	@Override
	public Member memberLogin(Member m) {
		return dao.memberLogin(session,m);
	}
	
}
