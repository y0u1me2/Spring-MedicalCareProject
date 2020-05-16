package com.web.spring.map.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.map.model.vo.Hospital;
import com.web.spring.map.model.vo.Hospital2;

public interface MapDao {

	int insertData(SqlSessionTemplate session, Hospital h);

	int insertData2(SqlSessionTemplate session, Hospital2 h);

}
