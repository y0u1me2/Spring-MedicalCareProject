package com.web.spring.reservation.model.vo;








import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {
	
	private int reservNo;
	private int memberNo;
	private String hospNo;
	private String hospDepartment;
	private String message;
	private Date reservDate;
	private String reservStatus;
	private String reservTime;
	
}
