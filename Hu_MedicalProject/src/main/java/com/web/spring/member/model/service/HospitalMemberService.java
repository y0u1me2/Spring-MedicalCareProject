package com.web.spring.member.model.service;

import java.util.List;

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
}
