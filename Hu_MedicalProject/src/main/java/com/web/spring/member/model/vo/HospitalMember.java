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
	private String hospitalName;
	private String hospNo;
	private String managerName;
	private String email;
	private String tel;
	private Date enrollDate;
}
