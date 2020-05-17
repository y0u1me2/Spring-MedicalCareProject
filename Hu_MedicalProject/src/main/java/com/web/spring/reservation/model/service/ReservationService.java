package com.web.spring.reservation.model.service;


import java.util.List;
import java.util.Map;

import com.web.spring.reservation.model.vo.Reservation;


public interface ReservationService {
	
	//리스트페이지
	List<Map<String,String>> reservationList();
	
	//접수하기
	int insertReservation(Reservation r);
	
	//코로나페이지로 이동
	List<Map<String,String>> corona(String no);
	
	//접수페이지로이동
	List<Map<String,String>> reservationView(String no);
	
}
