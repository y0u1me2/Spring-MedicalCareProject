package com.web.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.map.model.vo.Hospital;
import com.web.spring.member.model.vo.HospitalMember;

public interface HospitalMemberDao {

	int hospitalEnroll(SqlSessionTemplate session, HospitalMember h);

	HospitalMember hospitalLogin(SqlSessionTemplate session, HospitalMember h);

	//chat을 위한List받아오기
	List<HospitalMember> HpMemberList(SqlSessionTemplate session);

	List<Hospital> getHospList(SqlSessionTemplate session, String name);

	//메인-병원카운트
	int hospitalCount(SqlSessionTemplate session);

	//아이디 찾기
	String findHPId(SqlSessionTemplate session, Map<String, String> param);

	//비밀번호 찾기
	HospitalMember searchHPEmail(SqlSessionTemplate session, String email);

	//비밀번호 변경
	int changeHPMemberPsw(SqlSessionTemplate session, Map<String, Object> map);
}
