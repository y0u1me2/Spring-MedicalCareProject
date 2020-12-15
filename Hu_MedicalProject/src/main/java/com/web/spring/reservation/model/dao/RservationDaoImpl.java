package com.web.spring.reservation.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.spring.reservation.model.vo.Reservation;

@Repository
public class RservationDaoImpl implements ReservationDao {

	//리스트페이지
	@Override
	public List<Map<String, String>> reservationList(SqlSession session) {
		
		return session.selectList("rv.reservationList");
	}
	
	//접수하기
	@Override
	public int insertReservation(SqlSession session, Reservation r) {
		
		return session.insert("rv.insertReservation",r);
	}

	//코로나
	@Override
	public List<Map<String, String>> corona(SqlSession session, String no) {
		
		return session.selectList("rv.corona",no);
	}


	//접수
	@Override
	public List<Map<String, String>> reservationView(SqlSession session, String no) {
		
		return session.selectList("rv.reservationView",no);
	}

	@Override
	public int reservationCount(SqlSessionTemplate session) {
		return session.selectOne("rv.reservationCount");
	}
	
	
}
