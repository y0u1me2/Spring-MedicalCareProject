package com.web.spring.admin.healthInfo.service;

import java.util.List;
import java.util.Map;

import com.web.spring.healthInfo.vo.Confirmer;
import com.web.spring.healthInfo.vo.DisesaseCategory;

public interface AdminHealthInfoService {
	
	List<Map<String, String>> selectAllDisesase();
	List<Map<String, String>> selectAllConfirmer();

	List<Map<String, String>> selectAllHealthInfo(int cPage, int numPerpage, String keyword);
	
	int healthInfoCount(String keyword);
	
	DisesaseCategory selectDisesaseCategory(DisesaseCategory dc);
	Confirmer selectConfirmer(Confirmer c);
}
