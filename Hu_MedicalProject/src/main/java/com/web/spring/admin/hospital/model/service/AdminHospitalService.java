package com.web.spring.admin.hospital.model.service;

import java.util.List;

import com.web.spring.map.model.vo.Hospital2;
import com.web.spring.member.model.vo.HospitalMember;

public interface AdminHospitalService {

	List<HospitalMember> selectAllMembers(int cPage, int numPerPage);

	Hospital2 selectOneHospital(String hospNo);

	int updateOneHospital(Hospital2 h);

	int updateMemberStatus(int no);

	int totalMemberCount();

}
