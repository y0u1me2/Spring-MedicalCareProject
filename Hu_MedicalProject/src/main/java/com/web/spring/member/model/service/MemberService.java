package com.web.spring.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.web.spring.member.model.vo.Member;

public interface MemberService {

	int insertPerson(Member m);
	Member memberLogin(Member m);
	
	Member searchEmail(String email);
	
	
	int changeMemberPsw(Map<String, Object> map);
	
	String findEmail(Map<String, String> param);
	//구글 아이디 있니?
	Member googleIdChk(String googleEmail);
	//등록된 구글 아이ㅣㄷ 없으면 회원가입 시키기
	int googleInsert(Member googleNew);
	//이미 구글로 가입되어있어서 이메일로 찾아서 가져오기
	Member searchGoogleGetMember(String googleEmail);
	//이메일 인증 완료
	int emailComplete(String email);
	
	

}
