package com.web.spring.healthInfo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.healthInfo.dao.HealthInfoDao;

@Service
public class HealthInfoServiceImpl implements HealthInfoService {

	@Autowired
	private HealthInfoDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Map<String, String>> healthTagInfo(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.healthTagInfo(session, cPage, numPerpage);
	}

	@Override
	public int healthTagCount() {
		// TODO Auto-generated method stub
		return dao.healthTagCount(session);
	}
	
}
