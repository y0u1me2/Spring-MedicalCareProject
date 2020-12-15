package com.web.spring.carenotice.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CareNotice {
	
	private int careNo;
	private String careTitle;
	private String careWriter;
	private String careContent;
	private Date careDate;
	private int careReadCount;
	private String careStatus;
	private String answerStatus;
}

