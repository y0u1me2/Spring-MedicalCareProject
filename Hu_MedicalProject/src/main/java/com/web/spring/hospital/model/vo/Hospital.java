package com.web.spring.hospital.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hospital {
	private int no;
	private String id;
	private String password;
	private String hospitalName;
	private int hospitalNo;
	private String managerName;
	private String email;
	private String phone;
	private Date enrollDate;
}
