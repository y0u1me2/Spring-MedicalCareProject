package com.web.spring.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.member.model.vo.Hospital;

public interface HospitalMemberDao {

	int hospitalEnroll(SqlSessionTemplate session, Hospital h);

	Hospital hospitalLogin(SqlSessionTemplate session, Hospital h);

	//chat을 위한List받아오기
	List<Hospital> HpMemberList(SqlSessionTemplate session);
}
