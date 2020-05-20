package com.web.spring.healthInfo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Confirmer {
	private String confirmerNo;
	private String medicalNo;
	private String confirmerName;
	private String confirmerWork;
	private String confirmerJob;
	private String confirmerInfo;
	private String confirmerPic;
}
