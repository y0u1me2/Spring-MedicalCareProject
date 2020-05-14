package com.web.spring.member.model.service;

import java.util.Map;

import com.web.spring.member.model.vo.Member;

public interface MemberService {

	int insertPerson(Member m);
	Member memberLogin(Member m);
	
	Member searchEmail(String email);
	
	String getPw(Map<String, Object> paramMap);
	
	

}
