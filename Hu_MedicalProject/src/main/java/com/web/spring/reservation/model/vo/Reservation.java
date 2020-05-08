package com.web.spring.reservation.model.vo;




import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {
	
	private int reservNo;
	private int memberNo;
	private int hospitalNo;
	private String reservTime;
	private String message;
	private String office;
	private String items;
	
}
