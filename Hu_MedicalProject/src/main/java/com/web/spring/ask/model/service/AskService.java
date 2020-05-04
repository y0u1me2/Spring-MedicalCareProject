package com.web.spring.ask.model.service;

import java.util.List;
import java.util.Map;

import com.web.spring.ask.model.vo.Ask;
import com.web.spring.ask.model.vo.AskReply;

public interface AskService {

	int selectAskCount();

	List<Ask> selectAskList(int cPage, int numPerpage);

	int insertAsk(Ask ask);

	Ask selectAskView(int no);

	int updateAsk(Ask ask);

	int deleteAsk(int no);

	//답변등록
	int insertReply(AskReply reply);

	AskReply selectReplyView(int no);

}
