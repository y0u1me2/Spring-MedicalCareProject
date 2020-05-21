package com.web.spring.member.model.service;

import java.util.List;
import java.util.Map;

import com.web.spring.map.model.vo.Hospital;
import com.web.spring.member.model.vo.HospitalMember;

public interface HospitalMemberService {
	int hospitalEnroll(HospitalMember h);

	HospitalMember hospitalLogin(HospitalMember h);

	//chat을 위한  List받아오기
	List<HospitalMember> HpMemberList();

	List<Hospital> getHospList(String name);
	
	//메인-병원카운트
	int hospitalCount();

	//아이디 찾기
	String findHPId(Map<String, String> param);
	
	//비밀번호찾기
	//해당이메일이 있는지
	HospitalMember searchHPEmail(String email);
	//비밀번호 변경
	int changeHPMemberPsw(Map<String, Object> map);
}
