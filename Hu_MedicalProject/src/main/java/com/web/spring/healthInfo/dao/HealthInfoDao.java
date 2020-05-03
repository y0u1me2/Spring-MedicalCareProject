package com.web.spring.healthInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface HealthInfoDao {
	List<Map<String, String>> healthTagInfo(SqlSession session, int cPage, int numPerpage);
	int healthTagCount(SqlSession session);
}
