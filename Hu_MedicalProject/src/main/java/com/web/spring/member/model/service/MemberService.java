package com.web.spring.member.model.service;

import com.web.spring.member.model.vo.Member;

public interface MemberService {

	int insertPerson(Member m);
	Member memberLogin(Member m);
}
