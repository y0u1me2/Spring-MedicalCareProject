package com.web.spring.map.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.map.model.dao.MapDao;
import com.web.spring.map.model.vo.Hospital;
import com.web.spring.map.model.vo.Hospital2;

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

	@Override
	public int insertData2(List<Hospital2> list) {
		int count = 0;
		
		for(Hospital2 h : list) {
			int result = dao.insertData2(session, h);
			if(result>0) {
				count++;
			}
		}
		
		return count;
	}

}
