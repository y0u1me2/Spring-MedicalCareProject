package com.web.spring.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.map.model.vo.Hospital;
import com.web.spring.member.model.vo.HospitalMember;

@Repository
public class HospitalMemberDaoImpl implements HospitalMemberDao {

	@Override
	public int hospitalEnroll(SqlSessionTemplate session, HospitalMember h) {
		return session.insert("hpMember.enrollMember", h);
	}

	@Override
	public HospitalMember hospitalLogin(SqlSessionTemplate session, HospitalMember h) {
		return session.selectOne("hpMember.loginMember", h);
	}

	//chat을 위한 List받아오기
	@Override
	public List<HospitalMember> HpMemberList(SqlSessionTemplate session) {
		return session.selectList("hpMember.HpMemberList");
	}

	@Override
	public List<Hospital> getHospList(SqlSessionTemplate session, String name) {
		// TODO Auto-generated method stub
		return session.selectList("hospital.selectList", name);
	}
	
	

}
