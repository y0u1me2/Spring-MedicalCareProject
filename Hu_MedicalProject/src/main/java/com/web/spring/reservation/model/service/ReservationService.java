package com.web.spring.reservation.model.service;


import com.web.spring.reservation.model.vo.Reservation;


public interface ReservationService {
	
	//접수하기
	int insertReservation(Reservation r);
	
}
