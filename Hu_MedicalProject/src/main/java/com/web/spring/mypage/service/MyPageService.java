package com.web.spring.mypage.service;

import java.util.List;
import java.util.Map;

import com.web.spring.member.model.vo.Member;

public interface MyPageService {
	//비밀번호 체크
	Member passwordCheck(Member m);
	
	List<Map<String,String>> reservationStatus(int no);
	
}
