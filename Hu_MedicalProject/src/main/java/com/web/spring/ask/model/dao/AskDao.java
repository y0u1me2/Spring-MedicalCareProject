package com.web.spring.ask.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.ask.model.vo.Ask;
import com.web.spring.ask.model.vo.AskReply;

public interface AskDao {

	int selectAskCount(SqlSessionTemplate session);

	List<Ask> selectAskList(SqlSessionTemplate session, int cPage, int numPerpage);

	int insertAsk(SqlSessionTemplate session, Ask ask);

	Ask selectAskView(SqlSessionTemplate session, int no);

	int updateAsk(SqlSessionTemplate session, Ask ask);

	int deleteAsk(SqlSessionTemplate session, int no);
	
	List<Map<String, String>> searchAsk(SqlSessionTemplate session, Map<String, String> param);

	int searchAskCount(SqlSessionTemplate session);


//-------------------------Reply------------------------------------------------

//insert
	int insertReply(SqlSessionTemplate session, AskReply reply);
	
//selectOne
	AskReply selectReplyView(SqlSessionTemplate session, int no);
	
//delete
	int deleteReply(SqlSessionTemplate session, int no);
	
//update
	int updateReply(SqlSessionTemplate session, Map<String, Object> param);
	
//ReplyCount
	int selectReplyCount(SqlSessionTemplate session);

//selectList
	List<AskReply> selectReplyList(SqlSessionTemplate session, int cPage, int numPerpage);
//답변 완료 replycnt+1
	int replyCnt(SqlSessionTemplate session, int no);
//답변 완료 replycnt-1
	int deleteReplyCnt(SqlSessionTemplate session, int no);

	


}
