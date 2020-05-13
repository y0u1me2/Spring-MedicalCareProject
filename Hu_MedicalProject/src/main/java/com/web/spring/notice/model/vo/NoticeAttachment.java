package com.web.spring.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeAttachment {
	
	private  int attachmentNo;
	private int noticeNo;
	private String originalFilename;
	private String renamedFilename;
	private Date uploadDate;
	private int downLoadCount;
	private String status;

}
