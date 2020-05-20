package com.web.spring.admin.healthInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface AdminHealthInfoDao {
	
	List<Map<String, String>> selectAllDisesase(SqlSession session);
	
	List<Map<String, String>> selectAllHealthInfo(SqlSession session, int cPage, int numPerpage, String keyword);
	
	int healthInfoCount(SqlSession session, String keyword);
}
