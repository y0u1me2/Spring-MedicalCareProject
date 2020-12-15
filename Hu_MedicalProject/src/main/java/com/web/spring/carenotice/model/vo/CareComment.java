package com.web.spring.carenotice.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CareComment {
	
	private int commentNo;
	private int memberNo;
	private int careNo;
	private int commentLevel;
	private String commentWriter;
	private String commentContent;
	private int commentRef;
	private Date commentDate;
	
}
