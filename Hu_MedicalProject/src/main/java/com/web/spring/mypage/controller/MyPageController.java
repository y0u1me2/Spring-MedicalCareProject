package com.web.spring.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.member.controller.MemberController;
import com.web.spring.member.model.vo.Member;
import com.web.spring.mypage.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	private BCryptPasswordEncoder pwEncoder; // 단방향 암호화 객체

	@Autowired
	private MemberController mController;

	@Autowired
	private MyPageService service;// 멤버서비스용 객체

	// 마이페이지 메인 들어가기
	@RequestMapping("myPage/myPageMain")
	public ModelAndView myPageMain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("client/myPage/myPageMain");
		return mv;
	}

	// 새비번 기존비번과 중복체크
	@RequestMapping("myPage/passwordCheck")
	public ModelAndView passwordCheck(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Member m = new Member();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		m.setEmail(email);// 받아온 이메일 멤버에 셋팅
		Member checkedMember = service.passwordCheck(m);
		// 새비번과 기존비번 중복확인
		boolean duplication = false;
		duplication = pwEncoder.matches(password, checkedMember.getPassword());
		if (duplication) {// 일치시 탈퇴
			int result = service.deleteMember(m);
			if (result > 0) {
				mv.addObject("duplication", duplication);
			}
		} else {
			mv.addObject("duplication", duplication);
		}
		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping("myPage/memberUpdate.do")
	public String memberUpdate(Member m, Model model) {
		m.setPassword(pwEncoder.encode(m.getPassword()));
		int result = service.memberUpdate(m);

		String msg = "";
		String loc = "";

		if (result > 0) {
			System.out.println("성공");
			msg = "수정 성공";
		} else {
			System.out.println("실패");
			msg = "수정 실패! 홈으로 돌아갑니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "client/common/msg";
	}

	@RequestMapping("myPage/reservationStatus")
	public ModelAndView reservationStatus(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		System.out.println(request.getParameter("no"));
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		List<Map<String, String>> list = service.reservationStatus(no);

		System.out.println(list);
		mv.addObject("list", list);
		mv.setViewName("jsonview");

		return mv;
	}
}
