package com.web.spring.map.model.service;

import java.util.List;

import com.web.spring.map.model.vo.Hospital;
import com.web.spring.map.model.vo.Hospital2;

public interface MapService {

	int insertData(List<Hospital> list);

	int insertData2(List<Hospital2> list);

}
