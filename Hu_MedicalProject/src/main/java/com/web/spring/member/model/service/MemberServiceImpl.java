package com.web.spring.member.model.service;

import java.util.List;
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

	//이메일 인증
	@Override
	public int emailComplete(String email) {
		return dao.emailComplete(session,email);
	}


	@Override
	public Member memberLogin(Member m) {
		return dao.memberLogin(session,m);
	}
	
	//구글 아이디 있니?
	@Override
	public Member googleIdChk(String googleEmail) {
		return dao.googleIdChk(session,googleEmail);
	}

	@Override
	public int googleInsert(Member googleNew) {
		return dao.googleInsert(session,googleNew);
	}

	@Override
	public Member searchGoogleGetMember(String googleEmail) {
		return dao.searchGoogleGetMember(session,googleEmail);
	}

//아이디 찾기
	@Override
	public Member searchEmail(String email) {
		return dao.searchEmail(session,email);
	}

	 //탈퇴회원인가?
	@Override
	public Member leaveEmail(String email) {
		return dao.leaveEmail(session,email);
	}

	@Override
	public int changeMemberPsw(Map<String, Object> map) {
		return dao.changeMemberPsw(session,map);
	}


	@Override
	public String findEmail(Map<String, String> param) {
		return dao.findEmail(session,param);
	}

	
	
	
	
}
