package com.web.spring.ask.model.service;

import java.util.List;
import java.util.Map;

import com.web.spring.ask.model.vo.Ask;
import com.web.spring.ask.model.vo.AskReply;
import com.web.spring.member.model.vo.Member;

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
	
//update
	int updateReply(Map<String, Object> param);

//ReplyCount
	int selectReplyCount();

//ReplyList
	List<AskReply> selectReplyList(int cPage, int numPerpage);
//답변 완료 replycnt+1
	int replyCnt(int no);
//답변 대기 replycnt-1
	int deleteReplyCnt(int no);

//askList 조회
	List<Map<String, String>> searchAsk(Map<String, String> param);

	int searchAskCount();


}
