package com.web.spring.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HospitalMember {
	private int no;
	private String id;
	private String password;
	private String hospName;
	private String hospNo;
	private String managerName;
	private String managerEmail;
	private String managerPhone;
	private Date enrollDate;
	private String status;
}
