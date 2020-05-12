package com.web.spring.notice.model.service;

import java.util.List;

import com.web.spring.notice.model.vo.Notice;

public interface NoticeService {

	List<Notice> notice(int cPage, int numPerpage);

	int noticeCount();

	Notice noticeView(int no);

}
