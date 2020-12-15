package com.web.spring.member.model.dao;

import java.util.List;
import java.util.Map;

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

	//메인-병원카운트
	@Override
	public int hospitalCount(SqlSessionTemplate session) {
		return session.selectOne("hospital.hospitalCount");
	}

	//아이디 찾기
	@Override
	public String findHPId(SqlSessionTemplate session, Map<String, String> param) {
		return session.selectOne("hpMember.findHPId",param);
	}

	//비밀번호 찾기
	@Override
	public HospitalMember searchHPEmail(SqlSessionTemplate session, String email) {
		return session.selectOne("hpMember.searchHPEmail",email);
	}
	//비밀번호 변경
	@Override
	public int changeHPMemberPsw(SqlSessionTemplate session, Map<String, Object> map) {
		return session.update("hpMember.changeHPMemberPsw",map);
	}
	
	

}
