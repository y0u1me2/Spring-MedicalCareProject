package com.web.spring.healthInfo.service;

import java.util.List;
import java.util.Map;

public interface HealthInfoService {
	//태그 검색어 관련
	List<Map<String,String>> healthTagInfo(int cPage, int numPerpage);
	int healthTagCount();
	//버튼 분류관련
	List<Map<String,String>> healthBtnInfo();
}
