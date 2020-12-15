package com.web.spring.admin.healthInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.web.spring.healthInfo.vo.Confirmer;
import com.web.spring.healthInfo.vo.DisesaseCategory;
import com.web.spring.healthInfo.vo.HealthInfoContentPic;
import com.web.spring.healthInfo.vo.HealthInformation;

public interface AdminHealthInfoDao {
	
	List<Map<String, String>> selectAllDisesase(SqlSession session);
	
	List<Map<String, String>> selectAllConfirmer(SqlSession session);
	
	List<Map<String, String>> selectAllHealthInfo(SqlSession session, int cPage, int numPerpage, String keyword);
	
	int healthInfoCount(SqlSession session, String keyword);
	
	DisesaseCategory selectDisesaseCategory(SqlSession session, DisesaseCategory dc);
	
	List<HealthInformation> selectHealthInformationStep(SqlSession session, DisesaseCategory dc);
	
	Confirmer selectConfirmer(SqlSession session, Confirmer c);
	
	int insertDisesase(SqlSession session, DisesaseCategory dc);

	DisesaseCategory selectDisesaseNo(SqlSession session, DisesaseCategory dc);
	
	int insertConfirmer(SqlSession session, Confirmer c);
	
	Confirmer selectConfirmerNo(SqlSession session, Confirmer c);
	
	int getStepCount(SqlSession session, HealthInformation hi);
	
	int insertHealthInformation(SqlSession session, HealthInformation hi);
	
	int insertHealthInfoContentPic(SqlSession session, HealthInfoContentPic hicp);
	
	HealthInformation selectHealthInformationWithTitleAndSubTitle(SqlSession session, HealthInformation getHi);
}
