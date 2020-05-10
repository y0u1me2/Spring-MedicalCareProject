package com.web.spring.hospital.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.hospital.model.vo.Hospital;

public interface HospitalMemberDao {

	int hospitalEnroll(SqlSessionTemplate session, Hospital h);
}
