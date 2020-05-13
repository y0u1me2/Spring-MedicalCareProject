package com.web.spring.member.model.service;

import com.web.spring.member.model.vo.Hospital;

public interface HospitalMemberService {
	int hospitalEnroll(Hospital h);

	Hospital hospitalLogin(Hospital h);
}
