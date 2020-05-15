package com.web.spring.map.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.map.model.vo.Hospital;

public interface MapDao {

	int insertData(SqlSessionTemplate session, Hospital h);

}
