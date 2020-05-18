package com.web.spring.admin.person.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.admin.person.dao.AdminPersonDao;
import com.web.spring.member.model.vo.Member;


@Service
public class AdminPersonServiceImpl implements AdminPersonService{

	@Autowired
	private AdminPersonDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Member> adminPerson(int cPage, int numPerpage) {
		return dao.adminPerson(session,cPage,numPerpage);
	}

	@Override
	public int personCount() {
		return dao.personCount(session);
	}

	@Override
	public int personDelete(int no) {
		return dao.personDelete(session,no);
	}
	
	
	
}
