package com.web.spring.ask.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.ask.model.dao.AskDao;
import com.web.spring.ask.model.vo.Ask;

@Service
public class AskServiceImpl implements AskService {

	

	@Autowired
	private SqlSessionTemplate session;

	@Autowired
	private AskDao dao;

	@Override
	public int selectAskCount() {
		return dao.selectAskCount(session);
	}

	@Override
	public List<Ask> selectAskList(int cPage, int numPerpage) {
		return dao.selectAskList(session,cPage,numPerpage);
	}

	@Override
	public int insertAsk(Ask ask) {
		return dao.insertAsk(session,ask);
	}

	

	 

}
