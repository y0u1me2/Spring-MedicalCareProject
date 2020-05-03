package com.web.spring.healthInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class HealthInfoDaoImpl implements HealthInfoDao {
	//태그 검색어
	@Override
	public List<Map<String, String>> healthTagInfo(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("healthInfo.healthTagInfo",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	//태그 검색어 총 수
	@Override
	public int healthTagCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("healthInfo.healthTagCount");
	}
	//버튼 분류 
	@Override
	public List<Map<String, String>> healthBtnInfo(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("healthInfo.healthBtnInfo");
	}
	
	
	
}
