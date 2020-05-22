package com.web.spring.admin.hospital.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.map.model.vo.Hospital2;
import com.web.spring.member.model.vo.HospitalMember;

public interface AdminHospitalDao {

	List<HospitalMember> selectAllMembers(SqlSessionTemplate session, int cPage, int numPerPage);

	Hospital2 selectOneHospital(SqlSessionTemplate session, String hospNo);

	int updateOneHospital(SqlSessionTemplate session, Hospital2 h);

	int updateMemberStatus(SqlSessionTemplate session, int no);

	int totalMemberCount(SqlSessionTemplate session);

}
