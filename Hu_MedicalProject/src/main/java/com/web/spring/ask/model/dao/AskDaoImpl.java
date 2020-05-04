package com.web.spring.ask.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.ask.model.vo.Ask;

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
	public int insertReply(SqlSessionTemplate session, Map map) {
		return session.insert("reply.insertReply",map);
	}

	

}
