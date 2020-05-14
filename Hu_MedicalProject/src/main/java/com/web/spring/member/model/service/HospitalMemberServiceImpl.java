package com.web.spring.member.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.member.model.dao.HospitalMemberDao;
import com.web.spring.member.model.vo.Hospital;

@Service
public class HospitalMemberServiceImpl implements HospitalMemberService {
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private HospitalMemberDao dao;
	
	@Override
	public int hospitalEnroll(Hospital h) {
		int result = dao.hospitalEnroll(session, h);
		return result;
	}

	@Override
	public Hospital hospitalLogin(Hospital h) {
		return dao.hospitalLogin(session, h);
	}

//chat을 위한 List받아오기
	@Override
	public List<Hospital> HpMemberList() {
		return dao.HpMemberList(session);
	}
	

}
