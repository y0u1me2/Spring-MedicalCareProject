package com.web.spring.ask.model.service;

import java.util.List;

import com.web.spring.ask.model.vo.Ask;

public interface AskService {

	int selectAskCount();

	List<Ask> selectAskList(int cPage, int numPerpage);

}
