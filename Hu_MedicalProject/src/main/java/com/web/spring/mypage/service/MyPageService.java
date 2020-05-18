package com.web.spring.mypage.service;

import com.web.spring.member.model.vo.Member;

public interface MyPageService {
	//비밀번호 체크
	Member passwordCheck(Member m);
	//개인정보수정
	int memberUpdate(Member m);
	
	//회원탈퇴
	int deleteMember(Member m);
}
