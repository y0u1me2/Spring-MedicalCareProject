package com.web.spring.member.model.service;

import java.util.List;

import com.web.spring.member.model.vo.Hospital;

public interface HospitalMemberService {
	int hospitalEnroll(Hospital h);

	Hospital hospitalLogin(Hospital h);

	//chat을 위한  List받아오기
	List<Hospital> HpMemberList();
}
