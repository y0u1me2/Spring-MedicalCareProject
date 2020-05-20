package com.web.spring.admin.healthInfo.service;

import java.util.List;
import java.util.Map;

public interface AdminHealthInfoService {
	
	List<Map<String, String>> selectAllDisesase();

	List<Map<String, String>> selectAllHealthInfo(int cPage, int numPerpage, String keyword);
	
	int healthInfoCount(String keyword);
}
