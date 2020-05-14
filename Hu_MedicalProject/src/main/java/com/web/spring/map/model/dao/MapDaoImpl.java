package com.web.spring.map.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.map.model.vo.Hospital;

@Repository
public class MapDaoImpl implements MapDao {

	@Override
	public int insertData(SqlSessionTemplate session, Hospital h) {
		return session.insert("hospital.insertData", h);
	}

	

}
