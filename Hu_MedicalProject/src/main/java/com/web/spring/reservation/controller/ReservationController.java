package com.web.spring.reservation.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.reservation.model.service.ReservationService;
import com.web.spring.reservation.model.vo.Reservation;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService service;
	
	@Autowired
	private Logger logger;
	
//병원 리스트 페이지로 이동=================================
	
	@RequestMapping("rv/reservationList")
	public ModelAndView reservationList(ModelAndView mv) {
		
	List<Map<String,String>> list = service.reservationList();	
		
		mv.addObject("list", list);
		//mv.addObject("count", totalCount);
	
		mv.setViewName("client/reservation/reservationList");
		
		return mv;
	}
	
//병원접수 누르면 코로나문진 페이지로 이동======================
	
	@RequestMapping("/rv/corona")
	public ModelAndView corona(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		String no = request.getParameter("no");
		
		List<Map<String,String>> list = service.corona(no);		
						
		mv.addObject("list", list);
	
		mv.setViewName("client/reservation/corona");
		
		return mv;
	}	
	
//코로나문진 수정페이지로 이동============================
	
		@RequestMapping("/rv/coronaUpdate")
		public String coronaUpdate() {
			
			return "client/reservation/coronaUpdate";
		}	
	
//코로나문진 후 접수페이지로 이동============================
	
	@RequestMapping("/rv/reservationView")
	public ModelAndView reservationView(HttpServletRequest request) {
		
	ModelAndView mv = new ModelAndView();
		
		String no = request.getParameter("no");
		
		List<Map<String,String>> list = service.reservationView(no);		
						
		mv.addObject("list", list);
	
		mv.setViewName("client/reservation/reservationEnd");
		
		return mv;
	
	}	
	
//가족추가 페이지로 이동==================================
	
	/*
	 * @RequestMapping("/rv/family.do") public String familyAdd() {
	 * 
	 * return "client/reservation/familyAdd"; }
	 */
	
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
	
	

