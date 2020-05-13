package com.web.spring.notice.model.service;

import java.util.List;
import java.util.Map;

import com.web.spring.notice.model.vo.Notice;
import com.web.spring.notice.model.vo.NoticeAttachment;

public interface NoticeService {

	List<Notice> notice(int cPage, int numPerpage);

	int noticeCount();

	Notice noticeView(int no);

	int noticeInsert(Map<String, String> param, List<NoticeAttachment> fileNames);

	List<NoticeAttachment> selectNoticeFile(int no);

	int noticeDelete(int no);

}
