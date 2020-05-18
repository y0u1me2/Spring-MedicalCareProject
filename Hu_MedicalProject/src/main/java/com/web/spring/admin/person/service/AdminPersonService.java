package com.web.spring.admin.person.service;

import java.util.List;

import com.web.spring.member.model.vo.Member;

public interface AdminPersonService {

	//리스트 페이지 페이징, 화면 이동
	List<Member> adminPerson(int cPage, int numPerpage);

	//회원수 카운트
	int personCount();
	//회원 탈퇴
	int personDelete(int no);

}
