package com.web.spring.reservation.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.web.spring.reservation.model.vo.Reservation;

public interface ReservationDao {
	
	//리스트페이지
	List<Map<String,String>> reservationList(SqlSession session);
	
	//접수하기
	int insertReservation(SqlSession session, Reservation r);
	
	//코로나 페이지로 이동
	List<Map<String,String>> corona(SqlSession session,String no);
	
	//접수페이지로이동
	List<Map<String,String>> reservationView(SqlSession session,String no);
	 
}
