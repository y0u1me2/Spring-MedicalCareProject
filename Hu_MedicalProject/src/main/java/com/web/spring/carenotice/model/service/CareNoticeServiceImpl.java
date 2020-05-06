package com.web.spring.carenotice.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.spring.carenotice.model.dao.CareNoticeDao;
import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareNotice;


@Service
public class CareNoticeServiceImpl implements CareNoticeService {

	
	@Autowired
	private CareNoticeDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

//게시판리스트====================================================================
	
	@Override
	public List<CareNotice> careNotice(int cPage, int numPerPage) {
		
		List<CareNotice> list = dao.careNotice(session,cPage,numPerPage);

		return list;
	}

//게시판카운트======================================================================
	
	@Override
	public int careCount() {
		
		int result = dao.careCount(session);
		
		return result;
	}

//게시글등록===========================================================================
	@Override
	@Transactional
	public int insertCare(Map<String, String> param, List<CareAttachment> files) throws RuntimeException  {
		
		int result = dao.insertCare(session,param); if(result==0) throw new
		  RuntimeException();//트랜잭션처리
		  
		  
		  if(!files.isEmpty()) {//파일이 있으면 
			  for(CareAttachment a : files) {
				 a.setCareNo(Integer.parseInt(param.get("careNo")));//mybatis의 selectkey가  도와줌
				 result = dao.insertCareAttachment(session,a);
		  }
			  
		  
		  if(result==0) throw new RuntimeException();//트랜잭션처리 } 
		  
		  }	
	
		return result;
	}

	  
//게시글상세보기================================================
	
	@Override
	public CareNotice careView(int cno) {
		
		return dao.careView(session,cno);
	}
	
	@Override
	public List<CareAttachment> selectCareFile(int cno) {
		
		return dao.selectCareFile(session,cno);
	}


//게시글 수정화면이동============================================
	
	@Override
	public CareNotice updateView(int no) {
		
		return dao.updateView(session,no);
	}

//게시글 수정하기=================================================
	
	@Override
	public int updateCare(CareNotice c) {
		
		return dao.updateCare(session,c);
	}
	
	
//게시글 삭제하기=================================================
	
	@Override
	public int deleteCare(int no) {
		
		return dao.deleteCare(session,no);
	}



}
