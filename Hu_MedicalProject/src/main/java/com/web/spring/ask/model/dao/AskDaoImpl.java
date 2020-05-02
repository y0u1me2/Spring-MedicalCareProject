package com.web.spring.ask.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.ask.model.vo.Ask;

@Repository
public class AskDaoImpl implements AskDao {

	
	@Override
	public int selectAskCount(SqlSessionTemplate session) {
		return session.selectOne("ask.selectAskCount");
	}

	@Override
	public List<Ask> selectAskList(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("ask.selectAskList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int insertAsk(SqlSessionTemplate session, Ask ask) {
		return session.insert("ask.insertAsk",ask);
	}
	

}
