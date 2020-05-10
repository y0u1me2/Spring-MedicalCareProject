package com.web.spring.reservation.model.service;

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

	
//접수하기
	@Override
	public int insertReservation(Reservation r) {
		
		return dao.insertReservation(session,r);
	}
	
	
	
}
