package com.web.spring.admin.hospital.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.map.model.vo.Hospital2;
import com.web.spring.member.model.vo.HospitalMember;

@Repository
public class AdminHospitalDaoImpl implements AdminHospitalDao {

	@Override
	public List<HospitalMember> selectAllMembers(SqlSessionTemplate session) {
		return session.selectList("hospital.selectAllMembers");
	}

	@Override
	public Hospital2 selectOneHospital(SqlSessionTemplate session, String hospNo) {
		return session.selectOne("hospital.selectOneHospital", hospNo);
	}

	@Override
	public int updateOneHospital(SqlSessionTemplate session, Hospital2 h) {
		return session.update("hospital.updateOneHospital", h);
	}

	@Override
	public int updateMemberStatus(SqlSessionTemplate session, int no) {
		return session.update("hospital.updateMemberStatus", no);
	}

}
