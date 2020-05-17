package com.web.spring.reservation.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.reservation.model.dao.ReservationDao;
import com.web.spring.reservation.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

//리스트페이지	
	@Override
	public List<Map<String, String>> reservationList() {
	
		return dao.reservationList(session);
	
	}
//접수하기
	@Override
	public int insertReservation(Reservation r) {
		
		return dao.insertReservation(session,r);
	}
	
//코로나페이지로이동	
	@Override
	public List<Map<String, String>> corona(String no) {
	
		return dao.corona(session,no);
	}
	
//접수페이지로이동	
	@Override
	public List<Map<String, String>> reservationView(String no) {
		
		return dao.reservationView(session,no);
	}
	
	
	
	
}
