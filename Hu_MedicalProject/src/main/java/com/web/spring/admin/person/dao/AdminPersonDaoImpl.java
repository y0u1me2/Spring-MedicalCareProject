package com.web.spring.admin.person.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.member.model.vo.Member;

@Repository
public class AdminPersonDaoImpl implements AdminPersonDao {

	@Override
	public List<Member> adminPerson(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("person.adminPerson",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int personCount(SqlSessionTemplate session) {
		return session.selectOne("person.personCount");
	}

	@Override
	public int personDelete(SqlSessionTemplate session, int no) {
		return session.update("person.personDelete",no);
	}

	
	
}
