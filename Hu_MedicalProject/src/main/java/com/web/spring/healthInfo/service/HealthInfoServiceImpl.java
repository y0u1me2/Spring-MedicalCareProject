package com.web.spring.healthInfo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.healthInfo.dao.HealthInfoDao;
import com.web.spring.healthInfo.vo.HealthInformation;

@Service
public class HealthInfoServiceImpl implements HealthInfoService {

	@Autowired
	private HealthInfoDao dao;
	
	@Autowired
	private SqlSession session;
	
	
	//메인 토탈 카운터
	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return dao.totalCount(session);
	}
	//태그 검색어
	@Override
	public List<Map<String, String>> healthTagInfo(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.healthTagInfo(session, cPage, numPerpage);
	}
	//태그 검색어 총 수
	@Override
	public int healthTagCount() {
		// TODO Auto-generated method stub
		return dao.healthTagCount(session);
	}
	//버튼 분류 
	@Override
	public List<Map<String, String>> healthBtnInfo() {
		// TODO Auto-generated method stub
		return dao.healthBtnInfo(session);
	}
	@Override
	public List<Map<String, String>> frequentInfo() {
		// TODO Auto-generated method stub
		return dao.frequentInfo(session);
	}
	@Override
	public List<HealthInformation> frequentInfoPic(HealthInformation hi) {
		// TODO Auto-generated method stub
		return dao.frequentInfoPic(session, hi);
	}
	//서브에서 글사진눌렀을때 상세보기 전환
	@Override
	public HealthInformation subFrequentInfoPic(HealthInformation hi) {
		// TODO Auto-generated method stub
		return dao.subFrequentInfoPic(session, hi);
	}
	@Override
	public List<Map<String, String>> subFrequentInfoContent(String healthInfoNo) {
		// TODO Auto-generated method stub
		return dao.subFrequentInfoContent(session, healthInfoNo);
	}
	@Override
	public Map<String,String> selectConfirmer(String confirmerNo) {
		// TODO Auto-generated method stub
		return dao.selectConfirmer(session, confirmerNo);
	}
	//스텝별 분류 미니화면
	@Override
	public List<HealthInformation> searchInfoPicStep(HealthInformation hi) {
		// TODO Auto-generated method stub
		return dao.searchInfoPicStep(session, hi);
	}
	//검색어
	@Override
	public List<Map<String,String>> searchInformation(String term) {
		// TODO Auto-generated method stub
		return dao.searchInformation(session, term);
	}
	//검색어 실행
	@Override
	public HealthInformation searchHealthInfoKeyword(String searchKeyword) {
		// TODO Auto-generated method stub
		return dao.searchHealthInfoKeyword(session, searchKeyword);
	}
	@Override
	public List<Map<String, String>> searchHealthInfoList(String searchKeyword) {
		// TODO Auto-generated method stub
		return dao.searchHealthInfoList(session, searchKeyword);
	}
	
	
	
	
	
	
}
