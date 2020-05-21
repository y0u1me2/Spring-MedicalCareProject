package com.web.spring.admin.healthInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.web.spring.healthInfo.vo.Confirmer;
import com.web.spring.healthInfo.vo.DisesaseCategory;

public interface AdminHealthInfoDao {
	
	List<Map<String, String>> selectAllDisesase(SqlSession session);
	
	List<Map<String, String>> selectAllConfirmer(SqlSession session);
	
	List<Map<String, String>> selectAllHealthInfo(SqlSession session, int cPage, int numPerpage, String keyword);
	
	int healthInfoCount(SqlSession session, String keyword);
	
	DisesaseCategory selectDisesaseCategory(SqlSession session, DisesaseCategory dc);
	
	Confirmer selectConfirmer(SqlSession session, Confirmer c);
	
	int insertDisesase(SqlSession session, DisesaseCategory dc);
}
