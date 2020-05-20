package com.web.spring.notice.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.notice.model.dao.NoticeDao;
import com.web.spring.notice.model.vo.Notice;
import com.web.spring.notice.model.vo.NoticeAttachment;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private Logger logger;
/////////공지사항 페이지 ///////////
	@Override
	public List<Notice> notice(int cPage,int numPerpage) {
		return dao.notice(session,cPage,numPerpage);
	}
/////////공지사항 개수 카운트 ///////////
	@Override
	public int noticeCount() {
		return dao.noticeCount(session);
	}
/////////공지사항 상세 화면 ///////////
	@Override
	public Notice noticeView(int no) {
		return dao.noticeView(session,no);
	}
	@Override
	public List<NoticeAttachment> selectNoticeFile(int no) {
		// TODO Auto-generated method stub
		return dao.selectNoticeFile(session,no);
	}
/////////공지사항 작성 ///////////
	@Override
	public int noticeInsert(Map<String, String> param, List<NoticeAttachment> fileNames) {
		int result = dao.noticeInsert(session,param);
		if(result==0) {//트랜젝션 처리 ->보류
			throw new RuntimeException();
		}
		
		if(!fileNames.isEmpty()) {
			for(NoticeAttachment a : fileNames) {
				a.setNoticeNo(Integer.parseInt(param.get("noticeNo")));
				dao.insertNoticeAttachment(session,a);
				if(result==0) { //트랜젝션
					throw new RuntimeException();
				}
			}
		}
		return result;
	}

/////////공지사항 삭제 ///////////	
	@Override
	public int noticeDelete(int no) {
		// TODO Auto-generated method stub
		return dao.noticeDelete(session,no);
	}
/////////공지사항 수정 페이지 이동 ///////////
	@Override
	public Notice noticeUpdate(int no) {
		return dao.noticeUpdate(session,no);
	}

	@Override
	public List<NoticeAttachment> noticeUpdateFile(int no) {
		return dao.noticeUpdateFile(session,no);
	}
/////////공지사항 수정하기 ///////////
	@Override
	public int noticeUpdateEnd(Map<String, String> param, List<NoticeAttachment> files, int no) {

		int result = dao.noticeUpdateEnd(session,param); 
		
		if(result==0) throw new RuntimeException();
		  		  
		  if(!files.isEmpty()) {//파일이 있으면 
			  for(NoticeAttachment a : files) {
				 a.setNoticeNo(no);
				 result = dao.updateNoticeAttachment(session,a);
		  
				 if(result==0) throw new RuntimeException();
			  }
		  }	
	
		return result;
	}
/////////공지사항 제목으로 검색 ///////////
	@Override
	public List<Map<String, String>> searchNotice(Map<String, String> param) {
		return dao.searchNotice(session,param);
	}
	
	
	
}
