package com.web.spring.admin.healthInfo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.admin.healthInfo.dao.AdminHealthInfoDao;
import com.web.spring.healthInfo.vo.Confirmer;
import com.web.spring.healthInfo.vo.DisesaseCategory;

@Service
public class AdminHealthInfoServiceImpl implements AdminHealthInfoService {
	
	@Autowired
	AdminHealthInfoDao dao;
	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Map<String, String>> selectAllDisesase() {
		// TODO Auto-generated method stub
		return dao.selectAllDisesase(session);
	}
	

	@Override
	public List<Map<String, String>> selectAllConfirmer() {
		// TODO Auto-generated method stub
		return dao.selectAllConfirmer(session);
	}


	//건강정보 전체조회
	@Override
	public List<Map<String, String>> selectAllHealthInfo(int cPage, int numPerpage, String keyword) {
		// TODO Auto-generated method stub
		return dao.selectAllHealthInfo(session, cPage, numPerpage, keyword);
	}

	@Override
	public int healthInfoCount(String keyword) {
		// TODO Auto-generated method stub
		return dao.healthInfoCount(session, keyword);
	}


	@Override
	public DisesaseCategory selectDisesaseCategory(DisesaseCategory dc) {
		// TODO Auto-generated method stub
		return dao.selectDisesaseCategory(session, dc);
	}


	@Override
	public Confirmer selectConfirmer(Confirmer c) {
		// TODO Auto-generated method stub
		return dao.selectConfirmer(session, c);
	}
	
	
	
	
	
}
