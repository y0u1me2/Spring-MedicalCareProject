package com.web.spring.reservation.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.spring.reservation.model.vo.Reservation;

@Repository
public class RservationDaoImpl implements ReservationDao {

	@Override
	public int insertReservation(SqlSession session, Reservation r) {
		
		return session.insert("rv.insertReservation",r);
	}
	
	
}
