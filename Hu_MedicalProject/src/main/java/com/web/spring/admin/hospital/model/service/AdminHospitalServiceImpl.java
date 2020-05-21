package com.web.spring.admin.hospital.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.admin.hospital.model.dao.AdminHospitalDao;
import com.web.spring.map.model.vo.Hospital2;
import com.web.spring.member.model.vo.HospitalMember;

@Service
public class AdminHospitalServiceImpl implements AdminHospitalService {
	
	@Autowired
	private AdminHospitalDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<HospitalMember> selectAllMembers() {
		return dao.selectAllMembers(session);
	}

	@Override
	public Hospital2 selectOneHospital(String hospNo) {
		return dao.selectOneHospital(session, hospNo);
	}

	@Override
	public int updateOneHospital(Hospital2 h) {
		return dao.updateOneHospital(session, h);
	}

	@Override
	public int updateMemberStatus(int no) {
		return dao.updateMemberStatus(session, no);
	}

}
