package com.web.spring.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {

	private int memberNo;
	private String email;
	private String name;
	private String password;
	private String phone;
	private Date enrollDate;
	
}
