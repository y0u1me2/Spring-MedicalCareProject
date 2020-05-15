package com.web.spring.map.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hospital {
	private String hospNo;
	private String hospName;
	private String hospAddr;
	private String hospUrl;
	private String hospTel;
	private String latitude;
	private String longitude;
}
