package com.web.spring.member.model.service;

import java.util.Map;

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


	

	@Override
	public Member searchEmail(String email) {
		return dao.searchEmail(session,email);
	}


	@Override
	public String getPw(Map<String, Object> paramMap) {
		return dao.getPw(session,paramMap);
	}


	@Override
	public int changeMemberPsw(Map<String, Object> map) {
		return dao.changeMemberPsw(session,map);
	}
	
	
	
}
