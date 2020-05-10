package com.web.spring.healthInfo.service;

import java.util.List;
import java.util.Map;

import com.web.spring.healthInfo.vo.HealthInformation;

public interface HealthInfoService {
	//태그 검색어 관련
	List<Map<String,String>> healthTagInfo(int cPage, int numPerpage);
	int healthTagCount();
	//버튼 분류관련
	List<Map<String,String>> healthBtnInfo();
	//자주찾는 정보
	List<Map<String,String>> frequentInfo();
	//자주찾는 정보 클릭시
	List<HealthInformation> frequentInfoPic(HealthInformation hi);
}
