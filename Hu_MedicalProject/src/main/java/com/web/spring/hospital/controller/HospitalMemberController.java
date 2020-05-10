package com.web.spring.hospital.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.hospital.model.service.HospitalMemberService;
import com.web.spring.hospital.model.vo.Hospital;

@Controller
@SessionAttributes(value= {"loginMember", "loginType"})
public class HospitalMemberController {
	@Autowired
	private HospitalMemberService service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;//단방향 암호화
	
	//병원 회원가입
	@RequestMapping("/hospitalEnrollEnd.do")
	private ModelAndView hospitalEnrollEnd(Hospital h, ModelAndView mv) {
		h.setPassword(pwEncoder.encode(h.getPassword()));//비밀번호 암호화(단방향)
//		h.setPhone(encrypt(h.getPhone()));//양방향 암호화
//		h.setEmail(encrypt(h.getEmail()));//양방향 암호화
		
		int result = service.hospitalEnroll(h);
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg="가입 요청이 완료되었습니다. 관리자 승인 후 서비스를 사용하실 수 있습니다.";
			loc = "/";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
		}else {
			msg="회원 가입에 실패하였습니다.";
			mv.addObject("msg", msg);
		}
		
		mv.setViewName("client/common/msg");
		
		return mv;
	}
	
	//로그인
	@RequestMapping("/hospitalLogin.do")
	private String hospitalLogin(Hospital h, Model model) {
		
		Hospital hospital = service.hospitalLogin(h);
		
		String msg="";
		String loc="/";
		
		if(hospital!=null) {
			if(pwEncoder.matches(h.getPassword(), hospital.getPassword())) {//인코더 이용하여 비교
				//로그인 성공
				msg="로그인 성공";
				model.addAttribute("loginMember", hospital);
				model.addAttribute("loginType", "hospital");//로그인 유형
			}else {
				//비밀번호가 일치하지 않음
				msg="로그인 실패! 패스워드가 일치하지 않습니다.";
			}
		}else {
			//아이디가 존재하지 않음
			msg="로그인 실패! 아이디가 존재하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "client/common/msg";
	}
	
	//로그아웃
	@RequestMapping("/hospitalLogout.do")
	private String hospitalLogout(SessionStatus status, HttpSession session) {
		session.invalidate();
		
		if(!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/";
	}
	
}
