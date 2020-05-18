package com.web.spring.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.web.spring.member.model.vo.Member;

public interface MemberService {

	int insertPerson(Member m);
	Member memberLogin(Member m);
	
	Member searchEmail(String email);
	
	
	int changeMemberPsw(Map<String, Object> map);
	
	String findEmail(Map<String, String> param);
	
	

}
