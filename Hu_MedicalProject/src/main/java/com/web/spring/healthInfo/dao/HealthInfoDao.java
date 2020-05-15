package com.web.spring.healthInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.web.spring.healthInfo.vo.HealthInformation;

public interface HealthInfoDao {
	
	//메인 토탈카운터
	int totalCount(SqlSession session);
	//태그 검색어 관련
	List<Map<String, String>> healthTagInfo(SqlSession session, int cPage, int numPerpage);
	int healthTagCount(SqlSession session);
	//버튼 분류관련
	List<Map<String,String>> healthBtnInfo(SqlSession session);
	//자주찾는 사진정보
	List<Map<String,String>> frequentInfo(SqlSession session);
	//메인에서 자주찾는 사진정보 클릭
	List<HealthInformation> frequentInfoPic(SqlSession session, HealthInformation hi);
	//서브에서 정보 클릭
	HealthInformation subFrequentInfoPic(SqlSession session, HealthInformation hi);
	List<Map<String,String>> subFrequentInfoContent(SqlSession session, String healthInfoNo);
	Map<String,String> selectConfirmer(SqlSession session, String confirmerNo);
	//step으로 조회 리스트
	List<HealthInformation> searchInfoPicStep(SqlSession session, HealthInformation hi);
	//검색어
	List<Map<String,String>> searchInformation(SqlSession session, String term);
	//검색어 실행
	HealthInformation searchHealthInfoKeyword(SqlSession session, String searchKeyword);
	List<Map<String,String>> searchHealthInfoList(SqlSession session, String searchKeyword);
}
