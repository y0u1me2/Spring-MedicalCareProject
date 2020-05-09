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
//-------------------------Reply------------------------------------------------

//insert
	int insertReply(AskReply reply);
//selectOne
	AskReply selectReplyView(int no);
//delete
	int deleteReply(int no);


	int updateReply(Map<String, Object> param);

}
