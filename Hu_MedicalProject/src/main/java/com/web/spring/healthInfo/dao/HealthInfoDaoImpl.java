package com.web.spring.healthInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.spring.healthInfo.vo.HealthInformation;

@Repository
public class HealthInfoDaoImpl implements HealthInfoDao {
	
	//메인 토탈 카운터
	@Override
	public int totalCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("healthInfo.totalCount");
	}
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
	@Override
	public List<Map<String, String>> frequentInfo(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("healthInfo.healthTagInfo");
	}
	@Override
	public List<HealthInformation> frequentInfoPic(SqlSession session, HealthInformation hi) {
		// TODO Auto-generated method stub
		return session.selectList("healthInfo.frequentInfoPic",hi);
	}
	//건강정보 상세보기
	@Override
	public HealthInformation subFrequentInfoPic(SqlSession session, HealthInformation hi) {
		// TODO Auto-generated method stub
		return session.selectOne("healthInfo.subFrequentInfoPic",hi);
	}
	@Override
	public List<Map<String, String>> subFrequentInfoContent(SqlSession session, String healthInfoNo) {
		// TODO Auto-generated method stub
		return session.selectList("healthInfo.subFrequentInfoContent",healthInfoNo);
	}
	@Override
	public Map<String,String> selectConfirmer(SqlSession session, String confirmerNo) {
		// TODO Auto-generated method stub
		return session.selectOne("healthInfo.selectConfirmer",confirmerNo);
	}
	//스텝 분류 미니
	@Override
	public List<HealthInformation> searchInfoPicStep(SqlSession session, HealthInformation hi) {
		// TODO Auto-generated method stub
		return session.selectList("healthInfo.searchInfoPicStep",hi);
	}
	//검색어
	@Override
	public List<Map<String,String>> searchInformation(SqlSession session, String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("healthInfo.searchInformation",keyword);
	}
	//검색어 실행
	@Override
	public HealthInformation searchHealthInfoKeyword(SqlSession session, String searchKeyword) {
		// TODO Auto-generated method stub
		return session.selectOne("healthInfo.searchHealthInfoKeyword",searchKeyword);
	}
		
	@Override
	public List<Map<String, String>> searchHealthInfoList(SqlSession session, String searchKeyword) {
		// TODO Auto-generated method stub
		return session.selectList("healthInfo.searchHealthInfoList",searchKeyword);
	}
	
	
	
}
