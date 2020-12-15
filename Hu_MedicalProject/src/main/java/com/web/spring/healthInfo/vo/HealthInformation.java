package com.web.spring.healthInfo.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HealthInformation {
	private String healthInfoNo;
	private String disesaseNo;
	private String confirmerNo;
	private String medicalNo;
	private String healthInfoTitle;
	private String healthInfoSubTitle;
	private String healthInfoMainPic;
	private String healthInfoStep;
	private String healthInfoStepTitle;
}
