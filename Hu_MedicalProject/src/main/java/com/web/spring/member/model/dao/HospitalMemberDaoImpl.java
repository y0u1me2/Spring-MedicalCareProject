package com.web.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.member.model.vo.Hospital;

@Repository
public class HospitalMemberDaoImpl implements HospitalMemberDao {

	@Override
	public int hospitalEnroll(SqlSessionTemplate session, Hospital h) {
		return session.insert("hospital.enrollMember", h);
	}

	@Override
	public Hospital hospitalLogin(SqlSessionTemplate session, Hospital h) {
		return session.selectOne("hospital.loginMember", h);
	}

}
