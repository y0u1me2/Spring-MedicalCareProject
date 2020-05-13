package com.web.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.member.model.vo.Hospital;

public interface HospitalMemberDao {

	int hospitalEnroll(SqlSessionTemplate session, Hospital h);

	Hospital hospitalLogin(SqlSessionTemplate session, Hospital h);
}
