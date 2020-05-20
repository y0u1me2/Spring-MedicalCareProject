package com.web.spring.healthInfo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DisesaseCategory {
	private String disesaseNo;
	private String medicalNo;
	private String disesaseTitle;
	private String disesaseSubTitle;
	private String disesaseFile;
}
