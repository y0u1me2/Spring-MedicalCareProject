package com.web.spring.map.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.map.model.vo.Hospital;
import com.web.spring.map.model.vo.Hospital2;

@Repository
public class MapDaoImpl implements MapDao {

	@Override
	public int insertData(SqlSessionTemplate session, Hospital h) {
		return session.insert("hospital.insertData", h);
	}

	@Override
	public int insertData2(SqlSessionTemplate session, Hospital2 h) {
		// TODO Auto-generated method stub
		return session.insert("hospital.insertData2", h);
	}

	

}
