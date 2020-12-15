package com.web.spring.healthInfo.service;

import java.util.List;
import java.util.Map;

import com.web.spring.healthInfo.vo.HealthInformation;

public interface HealthInfoService {
	//메인페이지 카운터
	int totalCount();
	//태그 검색어 관련
	List<Map<String,String>> healthTagInfo(int cPage, int numPerpage);
	int healthTagCount();
	//버튼 분류관련
	List<Map<String,String>> healthBtnInfo();
	//자주찾는 정보
	List<Map<String,String>> frequentInfo();
	//메인에서 자주찾는 정보 클릭시
	List<HealthInformation> frequentInfoPic(HealthInformation hi);
	//서브에서 정보 클릭시
	HealthInformation subFrequentInfoPic(HealthInformation hi);
	List<Map<String,String>> subFrequentInfoContent(String healthInfoNo);
	Map<String,String> selectConfirmer(String confirmerNo);
	//step으로 조회 리스트
	List<HealthInformation> searchInfoPicStep(HealthInformation hi);
	//검색
	List<Map<String,String>> searchInformation(String term);
	//검색어 실행
	HealthInformation searchHealthInfoKeyword(String searchKeyword);
	List<Map<String,String>> searchHealthInfoList(String searchKeyword);
}
