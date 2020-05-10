package com.web.spring.hospital.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.hospital.model.dao.HospitalMemberDao;
import com.web.spring.hospital.model.vo.Hospital;

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

}
