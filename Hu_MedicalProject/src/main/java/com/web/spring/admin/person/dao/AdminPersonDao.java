package com.web.spring.admin.person.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.member.model.vo.Member;

public interface AdminPersonDao {

	List<Member> adminPerson(SqlSessionTemplate session, int cPage, int numPerpage);

	int personCount(SqlSessionTemplate session);

	int personDelete(SqlSessionTemplate session, int no);

}
