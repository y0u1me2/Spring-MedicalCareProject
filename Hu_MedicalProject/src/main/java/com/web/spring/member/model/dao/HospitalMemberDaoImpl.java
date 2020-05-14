package com.web.spring.member.model.dao;

import java.util.List;

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

	//chat을 위한 List받아오기
	@Override
	public List<Hospital> HpMemberList(SqlSessionTemplate session) {
		return session.selectList("hospital.HpMemberList");
	}
	
	

}
