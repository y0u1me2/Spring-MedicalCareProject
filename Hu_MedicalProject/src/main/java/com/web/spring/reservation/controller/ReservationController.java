package com.web.spring.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.spring.reservation.model.service.ReservationService;
import com.web.spring.reservation.model.vo.Reservation;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService service;
	
	
//병원 리스트 페이지로 이동=================================
	
	@RequestMapping("rv/reservationList")
	public String reservationList() {
		
		return "client/reservation/reservationList";
	}
	
//병원접수 누르면 코로나문진 페이지로 이동======================
	
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
	
	
//가족추가 페이지로 이동==================================
	
	@RequestMapping("/rv/family.do")
	public String familyAdd() {
		
		return "client/reservation/familyAdd";
	}
	
//병원 접수하기========================================	
	
	@RequestMapping("/rv/reservationEnd")
	public String insertReservation(Reservation r, Model m) {
	
		int result = service.insertReservation(r);		
		
			
			String msg="";
			String loc="/rv/reservationView";
				
			if(result>0) {
					msg="접수가 완료되었습니다.";	
					//접수현황페이지 이동으로 바꿀것!
					
				}else {
					msg="접수가 실패되었습니다.";
					
				}
			
				m.addAttribute("msg",msg);
				m.addAttribute("loc",loc);
				return "client/common/msg";
			}	
		
	}
	
	

