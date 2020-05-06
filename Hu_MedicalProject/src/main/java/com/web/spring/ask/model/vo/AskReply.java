package com.web.spring.ask.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AskReply {

	private int replyNo;
	private String replyContent;
	private Date replyDate;
	private int replyRefNo;
	
}
