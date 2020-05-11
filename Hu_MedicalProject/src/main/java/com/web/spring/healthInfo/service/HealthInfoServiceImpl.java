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
	@Override
	public HealthInformation subFrequentInfoPic(HealthInformation hi) {
		// TODO Auto-generated method stub
		return dao.subFrequentInfoPic(session, hi);
	}
	
	
	
}
