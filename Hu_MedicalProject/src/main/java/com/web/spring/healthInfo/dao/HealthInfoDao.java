package com.web.spring.healthInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface HealthInfoDao {
	//태그 검색어 관련
	List<Map<String, String>> healthTagInfo(SqlSession session, int cPage, int numPerpage);
	int healthTagCount(SqlSession session);
	//버튼 분류관련
	List<Map<String,String>> healthBtnInfo(SqlSession session);
}
