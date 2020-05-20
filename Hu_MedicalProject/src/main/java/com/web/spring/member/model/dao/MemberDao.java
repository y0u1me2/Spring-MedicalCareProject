package com.web.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.member.model.vo.Member;

public interface MemberDao {

	
	int insertPerson(SqlSessionTemplate session, Member m);
	
	Member memberLogin(SqlSessionTemplate session, Member m);
	
	Member searchEmail(SqlSessionTemplate session, String email);

	int changeMemberPsw(SqlSessionTemplate session, Map<String, Object> map);

	String findEmail(SqlSessionTemplate session, Map<String, String> param);
//구글아이디 있니?
	Member googleIdChk(SqlSessionTemplate session, String googleEmail);

	int googleInsert(SqlSessionTemplate session, Member googleNew);

	Member searchGoogleGetMember(SqlSessionTemplate session, String googleEmail);

	
	

}
