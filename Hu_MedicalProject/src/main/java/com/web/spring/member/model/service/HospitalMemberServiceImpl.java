package com.web.spring.member.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.map.model.vo.Hospital;
import com.web.spring.member.model.dao.HospitalMemberDao;
import com.web.spring.member.model.vo.HospitalMember;

@Service
public class HospitalMemberServiceImpl implements HospitalMemberService {
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private HospitalMemberDao dao;
	
	@Override
	public int hospitalEnroll(HospitalMember h) {
		int result = dao.hospitalEnroll(session, h);
		return result;
	}

	@Override
	public HospitalMember hospitalLogin(HospitalMember h) {
		return dao.hospitalLogin(session, h);
	}

//chat을 위한 List받아오기
	@Override
	public List<HospitalMember> HpMemberList() {
		return dao.HpMemberList(session);
	}

	@Override
	public List<Hospital> getHospList(String name) {
		return dao.getHospList(session, name);
	}
	

}
