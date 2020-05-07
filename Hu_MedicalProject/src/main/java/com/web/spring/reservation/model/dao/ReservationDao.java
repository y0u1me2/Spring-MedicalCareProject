package com.web.spring.reservation.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.web.spring.reservation.model.vo.Reservation;

public interface ReservationDao {
	
	//접수하기
	int insertReservation(SqlSession session, Reservation r);
}
