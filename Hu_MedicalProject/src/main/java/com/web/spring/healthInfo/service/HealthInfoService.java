package com.web.spring.healthInfo.service;

import java.util.List;
import java.util.Map;

public interface HealthInfoService {
	List<Map<String,String>> healthTagInfo(int cPage, int numPerpage);
	int healthTagCount();
}
