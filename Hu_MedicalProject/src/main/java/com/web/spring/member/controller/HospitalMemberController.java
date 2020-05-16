package com.web.spring.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.common.AESEncrypt;
import com.web.spring.map.model.vo.Hospital;
import com.web.spring.member.model.service.HospitalMemberService;
import com.web.spring.member.model.vo.HospitalMember;

@Controller
@SessionAttributes(value= {"loginHpMember"})
public class HospitalMemberController {
	@Autowired
	private HospitalMemberService service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;//단방향 암호화
	
	@Autowired
	private AESEncrypt encryptor;
	
	@RequestMapping("/getHospList.do")
	@ResponseBody
	private List<Hospital> getHospList(String name){
		List<Hospital> list = service.getHospList(name);
		System.out.println(list);
		return list;
	}
	
	//병원 회원가입
	@RequestMapping("/hospitalEnrollEnd.do")
	private ModelAndView hospitalEnrollEnd(HospitalMember h, ModelAndView mv) {
		System.out.println(h);
		h.setPassword(pwEncoder.encode(h.getPassword()));//단방향 암호화(비밀번호)
		h.setManagerPhone(encryptor.encrypt(h.getManagerPhone()));//양방향 암호화(휴대폰)
		h.setManagerEmail(encryptor.encrypt(h.getManagerEmail()));//양방향 암호화(이메일)
		
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
	@RequestMapping("/member/hospitalLogin.do")
	private String hospitalLogin(HospitalMember h, Model model) {
		
		HospitalMember hospital = service.hospitalLogin(h);
		System.out.println(hospital);
		
		String msg="";
		String loc="/";
		
		if(hospital!=null) {
			if(pwEncoder.matches(h.getPassword(), hospital.getPassword())) {//인코더 이용하여 비교
				//로그인 성공
				msg="로그인 성공";
				model.addAttribute("loginHpMember", hospital);
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
	@RequestMapping("/member/hospitalLogout.do")
	private String hospitalLogout(SessionStatus status, HttpSession session) {
		session.invalidate();
		
		if(!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/";
	}
	
}
