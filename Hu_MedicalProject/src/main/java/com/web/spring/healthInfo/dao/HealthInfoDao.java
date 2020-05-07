package com.web.spring.healthInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.web.spring.healthInfo.vo.HealthInformation;

public interface HealthInfoDao {
	//태그 검색어 관련
	List<Map<String, String>> healthTagInfo(SqlSession session, int cPage, int numPerpage);
	int healthTagCount(SqlSession session);
	//버튼 분류관련
	List<Map<String,String>> healthBtnInfo(SqlSession session);
	//자주찾는 사진정보
	List<Map<String,String>> frequentInfo(SqlSession session);
	//자주찾는 사진정보 클릭
	List<HealthInformation> frequentInfoPic(SqlSession session, HealthInformation hi);
}
