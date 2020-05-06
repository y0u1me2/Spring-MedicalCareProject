package com.web.spring.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {

//병원예약 페이지로 이동=================================
	
	@RequestMapping("rv/reservationList")
	public String reservationList() {
		
		return "client/reservation/reservationList";
	}
	
//병원예약 누르면 코로나문진 페이지로 이동======================
	
	@RequestMapping("/rv/corona")
	public String corona() {
		
		return "client/reservation/corona";
	}	
	
//코로나문진 수정페이지로 이동============================
	
		@RequestMapping("/rv/coronaUpdate")
		public String coronaUpdate() {
			
			return "client/reservation/coronaUpdate";
		}	
	
//코로나문진 후 접수페이지로 이동============================
	
	@RequestMapping("/rv/reservationView")
	public String reservationView() {
		
		return "client/reservation/reservationEnd";
	}
	
//날짜 시간선택 페이지로 이동===========================
	
	@RequestMapping("/rv/reservationTime")
	public String reservationTime() {
		
		return "client/reservation/reservationTime";
	}
	
}
