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

//-------------------------Reply------------------------------------------------

//insert
	int insertReply(SqlSessionTemplate session, AskReply reply);
//selectOne
	AskReply selectReplyView(SqlSessionTemplate session, int no);
//delete
	int deleteReply(SqlSessionTemplate session, int no);

	int updateReply(SqlSessionTemplate session, AskReply reply);

}
