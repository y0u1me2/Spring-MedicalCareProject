package com.web.spring.map.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.map.model.dao.MapDao;
import com.web.spring.map.model.vo.Hospital;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	private MapDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertData(List<Hospital> list) {
		
		int count = 0;
		
		for(Hospital h : list) {
			int result = dao.insertData(session, h);
			if(result>0) {
				count++;
			}
		}
		
		return count;
	}

}
