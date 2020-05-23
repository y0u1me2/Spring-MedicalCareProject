package com.web.spring.admin.healthInfo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.admin.healthInfo.dao.AdminHealthInfoDao;
import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.healthInfo.vo.Confirmer;
import com.web.spring.healthInfo.vo.DisesaseCategory;
import com.web.spring.healthInfo.vo.HealthInfoContentPic;
import com.web.spring.healthInfo.vo.HealthInformation;

@Service
public class AdminHealthInfoServiceImpl implements AdminHealthInfoService {
	
	@Autowired
	AdminHealthInfoDao dao;
	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Map<String, String>> selectAllDisesase() {
		// TODO Auto-generated method stub
		return dao.selectAllDisesase(session);
	}
	

	@Override
	public List<Map<String, String>> selectAllConfirmer() {
		// TODO Auto-generated method stub
		return dao.selectAllConfirmer(session);
	}


	//건강정보 전체조회
	@Override
	public List<Map<String, String>> selectAllHealthInfo(int cPage, int numPerpage, String keyword) {
		// TODO Auto-generated method stub
		return dao.selectAllHealthInfo(session, cPage, numPerpage, keyword);
	}

	@Override
	public int healthInfoCount(String keyword) {
		// TODO Auto-generated method stub
		return dao.healthInfoCount(session, keyword);
	}


	@Override
	public DisesaseCategory selectDisesaseCategory(DisesaseCategory dc) {
		// TODO Auto-generated method stub
		return dao.selectDisesaseCategory(session, dc);
	}
	


	@Override
	public List<HealthInformation> selectHealthInformationStep(DisesaseCategory dc) {
		// TODO Auto-generated method stub
		return dao.selectHealthInformationStep(session, dc);
	}


	@Override
	public Confirmer selectConfirmer(Confirmer c) {
		// TODO Auto-generated method stub
		return dao.selectConfirmer(session, c);
	}


	@Override
	public int insertDisesase(DisesaseCategory dc) {
		// TODO Auto-generated method stub
		return dao.insertDisesase(session, dc);
	}


	@Override
	public DisesaseCategory selectDisesaseNo(DisesaseCategory dc) {
		// TODO Auto-generated method stub
		return dao.selectDisesaseNo(session, dc);
	}


	@Override
	public int insertConfirmer(Confirmer c) {
		// TODO Auto-generated method stub
		return dao.insertConfirmer(session, c);
	}


	@Override
	public Confirmer selectConfirmerNo(Confirmer c) {
		// TODO Auto-generated method stub
		return dao.selectConfirmerNo(session, c);
	}


	@Override
	public int getStepCount(HealthInformation hi) {
		// TODO Auto-generated method stub
		return dao.getStepCount(session, hi);
	}


	@Override
	public int insertHealthInformation(HealthInformation hi) {
		// TODO Auto-generated method stub
		return dao.insertHealthInformation(session, hi);
	}


	@Override
	public int insertHealthInfoContentPic(HealthInformation hi, List<HealthInfoContentPic> files) throws RuntimeException  {
//		
//		int result = dao.insertCare(session,hi); if(result==0) throw new
//		  RuntimeException();//트랜잭션처리
		  
		  int result=0;
		  if(!files.isEmpty()) {//파일이 있으면 
			  for(HealthInfoContentPic hicp : files) {
				  hicp.setHealthInfoNo(hi.getHealthInfoNo());//mybatis의 selectkey가  도와줌
				  result = dao.insertHealthInfoContentPic(session, hicp);
		  }
			  
		  
		  if(result==0) throw new RuntimeException();//트랜잭션처리 } 
		  
		  }	
	
		return result;
	}


	@Override
	public HealthInformation selectHealthInformationWithTitleAndSubTitle(HealthInformation getHi) {
		// TODO Auto-generated method stub
		return dao.selectHealthInformationWithTitleAndSubTitle(session, getHi);
	}
	
	
	
	
	
}
