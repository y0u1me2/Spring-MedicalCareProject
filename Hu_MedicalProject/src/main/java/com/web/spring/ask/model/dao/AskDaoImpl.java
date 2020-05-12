package com.web.spring.ask.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.ask.model.vo.Ask;
import com.web.spring.ask.model.vo.AskReply;

@Repository
public class AskDaoImpl implements AskDao {

//selectList 및 페이징처리	
	@Override
	public int selectAskCount(SqlSessionTemplate session) {
		return session.selectOne("ask.selectAskCount");
	}

	@Override
	public List<Ask> selectAskList(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("ask.selectAskList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
//insert
	@Override
	public int insertAsk(SqlSessionTemplate session, Ask ask) {
		return session.insert("ask.insertAsk",ask);
	}
//selectOne
	@Override
	public Ask selectAskView(SqlSessionTemplate session, int no) {
		return session.selectOne("ask.selectAsk",no);
	}


	//update
	@Override
	public int updateAsk(SqlSessionTemplate session, Ask ask) {
		return session.update("ask.updateAsk", ask);
	}
//delete


	@Override
	public int deleteAsk(SqlSessionTemplate session, int no) {
		return session.delete("ask.deleteAsk",no);
	}
	
	@Override
	public List<Map<String, String>> searchAsk(SqlSessionTemplate session, Map<String, String> param) {
		return session.selectList("ask.searchAsk",param);
	}
	
	
	
//-------------------------Reply------------------------------------------------
	
//insert
	@Override
	public int insertReply(SqlSessionTemplate session,AskReply reply) {
		return session.insert("reply.insertReply",reply);
	}
//selectOne
	@Override
	public AskReply selectReplyView(SqlSessionTemplate session, int no) {
		return session.selectOne("reply.selectReplyView",no);
	}
	
//delete
	@Override
	public int deleteReply(SqlSessionTemplate session, int no) {
		return session.delete("reply.deleteReply",no);
	}
//update
	@Override
	public int updateReply(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("reply.updateReply", param);
	}
//replyList
	@Override
	public int selectReplyCount(SqlSessionTemplate session) {
		return session.selectOne("reply.selectReplyCount");
	}
//selectList
	@Override
	public List<AskReply> selectReplyList(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("reply.selectReplyList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
//답변 완료 replycnt+1
	@Override
	public int replyCnt(SqlSessionTemplate session, int no) {
		return session.update("ask.replyCnt",no);
	}
//답변 완료 replycnt-1
	@Override
	public int deleteReplyCnt(SqlSessionTemplate session, int no) {
		return session.update("ask.deleteReplyCnt",no);
	}

	

	

	

}
