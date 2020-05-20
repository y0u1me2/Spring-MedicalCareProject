package com.web.spring.admin.healthInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.spring.healthInfo.vo.Confirmer;
import com.web.spring.healthInfo.vo.DisesaseCategory;

@Repository
public class AdminHealthInfoDaoImpl implements AdminHealthInfoDao {

	
	
	@Override
	public List<Map<String, String>> selectAllDisesase(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("adminHealthInfo.selectAllDisesase");
	}
		

	@Override
	public List<Map<String, String>> selectAllConfirmer(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("adminHealthInfo.selectAllConfirmer");
	}



	@Override
	public List<Map<String, String>> selectAllHealthInfo(SqlSession session, int cPage, int numPerpage, String keyword1) {
		// TODO Auto-generated method stub
		RowBounds row = new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("adminHealthInfo.selectAllHealthInfo",keyword1,row);
	}

	@Override
	public int healthInfoCount(SqlSession session, String keyword2) {
		// TODO Auto-generated method stub
		return session.selectOne("adminHealthInfo.healthInfoCount",keyword2);
	}


	@Override
	public DisesaseCategory selectDisesaseCategory(SqlSession session, DisesaseCategory dc) {
		// TODO Auto-generated method stub
		return session.selectOne("adminHealthInfo.selectDisesaseCategory",dc);
	}


	@Override
	public Confirmer selectConfirmer(SqlSession session, Confirmer c) {
		// TODO Auto-generated method stub
		return session.selectOne("adminHealthInfo.selectConfirmer",c);
	}

	
	
}
