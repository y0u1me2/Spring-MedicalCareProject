package com.web.spring.notice.model.service;

import java.util.List;
import java.util.Map;

import com.web.spring.notice.model.vo.Notice;
import com.web.spring.notice.model.vo.NoticeAttachment;

public interface NoticeService {
/////////공지사항 페이지 ///////////
	List<Notice> notice(int cPage, int numPerpage);
/////////공지사항 개수 카운트 ///////////
	int noticeCount();
/////////공지사항 상세 화면 ///////////
	Notice noticeView(int no);
	List<NoticeAttachment> selectNoticeFile(int no);
/////////공지사항 작성 ///////////
	int noticeInsert(Map<String, String> param, List<NoticeAttachment> fileNames);
/////////공지사항 삭제 ///////////
	int noticeDelete(int no);
/////////공지사항 수정 페이지 이동 ///////////
	Notice noticeUpdate(int no);
	List<NoticeAttachment> noticeUpdateFile(int no);
/////////공지사항 수정하기 ///////////
	int noticeUpdateEnd(Map<String, String> param, List<NoticeAttachment> files, int no);
/////////공지사항 제목으로 검색 ///////////
	List<Map<String, String>> searchNotice(Map<String, String> param);

}
