package com.web.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.member.model.vo.Member;

public interface MemberDao {

	
	int insertPerson(SqlSessionTemplate session, Member m);
	
	Member memberLogin(SqlSessionTemplate session, Member m);


}
