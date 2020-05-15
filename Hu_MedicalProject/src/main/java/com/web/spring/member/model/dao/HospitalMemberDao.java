package com.web.spring.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.map.model.vo.Hospital;
import com.web.spring.member.model.vo.HospitalMember;

public interface HospitalMemberDao {

	int hospitalEnroll(SqlSessionTemplate session, HospitalMember h);

	HospitalMember hospitalLogin(SqlSessionTemplate session, HospitalMember h);

	//chat을 위한List받아오기
	List<HospitalMember> HpMemberList(SqlSessionTemplate session);

	List<Hospital> getHospList(SqlSessionTemplate session, String name);
}
