package com.web.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.spring.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	
	@Override
	public int insertPerson(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertPerson",m);
	}

	@Override
	public Member memberLogin(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.memberLogin",m);
	}
//구글 로그인
	@Override
	public Member googleIdChk(SqlSessionTemplate session, String googleEmail) {
		return session.selectOne("member.googleIdChk",googleEmail);
	}

	@Override
	public int googleInsert(SqlSessionTemplate session, Member googleNew) {
		return session.insert("member.googleInsert",googleNew);
	}
@Override
	public Member searchGoogleGetMember(SqlSessionTemplate session, String googleEmail) {
	return session.selectOne("member.searchGoogleGetMember",googleEmail);
	}

	//아이디 찾기
	@Override
	public Member searchEmail(SqlSessionTemplate session, String email) {
		return session.selectOne("member.searchEmail",email);
	}

	@Override
	public int changeMemberPsw(SqlSessionTemplate session, Map<String, Object> map) {
		return session.update("member.changeMemberPsw", map);
	}

	@Override
	public String findEmail(SqlSessionTemplate session, Map<String, String> param) {
		return session.selectOne("member.findEmail",param);
	}

}
