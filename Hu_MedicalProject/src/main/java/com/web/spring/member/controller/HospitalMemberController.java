package com.web.spring.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.common.AESEncrypt;
import com.web.spring.map.model.vo.Hospital;
import com.web.spring.member.model.service.HospitalMemberService;
import com.web.spring.member.model.vo.HospitalMember;
import com.web.spring.member.model.vo.Member;

@Controller
@SessionAttributes(value= {"loginHpMember"})
public class HospitalMemberController {
	@Autowired
	private HospitalMemberService service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;//단방향 암호화
	
	@Autowired
	private AESEncrypt encryptor;
	
	@Autowired
	Logger logger;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
		//h.setManagerPhone(encryptor.encrypt(h.getManagerPhone()));//양방향 암호화(휴대폰)
		//h.setManagerEmail(encryptor.encrypt(h.getManagerEmail()));//양방향 암호화(이메일)
		
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
	
	// 아이디 찾기  ////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/findUserHPEmail.do")
    public ModelAndView findEmail(@RequestParam("hospitalName") String name,
    							  @RequestParam("hospitalCall") String phone,
    							  ModelAndView mv,Member m) {
		System.out.println(name);
		System.out.println(phone);
		
		Map<String,String> param = new HashMap<String,String>();
		param.put("name",name);
		param.put("phone",phone);
		
		
		String userMail = service.findHPId(param);
		
		System.out.println(userMail);
		
		if(userMail != null) {
			mv.addObject("userMail",userMail);
			mv.setViewName("jsonView");
		}else {
			mv.addObject("userMail",1);
			mv.setViewName("jsonView");
		}
		
		return mv;
    }
	
	//비밀번호 찾기
	//등록된 이메일이 있는지 검사
	@RequestMapping("/searchHPEmail.do")
	public ModelAndView searchEmail(@RequestParam("HPemail") String email, ModelAndView mv) {
		System.out.println(email);
		
		HospitalMember member = service.searchHPEmail(email);
		//String id = member.getEmail();
		//System.out.println(id);
		System.out.println(member);
		if(member != null) {
			mv.addObject("member",0);
			mv.setViewName("jsonView");
		}else {
			mv.addObject("member",1);
			mv.setViewName("jsonView");
		}
		 return mv;
	}
	
	@RequestMapping("/findHPPass.do")
	public ModelAndView sendEmailAction(HttpServletRequest request,@RequestParam("hospitalEmail") String hospitalEmail,
            HttpServletResponse response_email, ModelAndView mv) throws IOException {
		System.out.println(hospitalEmail);
		 Random r = new Random();
         int dice = r.nextInt(157211)+48271;
         
         String setfrom = "qkrejrgus4713@gmail.com";
         String tomail = hospitalEmail;    //받는 사람의 이메일
         String title = "비밀번호 찾기 인증 이메일 입니다.";    //제목
         String content =
         
               
                 "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다."
                 
                +
         
                 "비밀번호 찾기 인증번호는 " +dice+ " 입니다. "
                 
               +
                 "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
         
         try {

             MimeMessage message = mailSender.createMimeMessage();
             MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

             messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
             messageHelper.setTo(tomail); // 받는사람 이메일
             messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
             messageHelper.setText(content); // 메일 내용
             
             mailSender.send(message);
     
         } catch (Exception e) {
             System.out.println(e);
         }
         
       
         mv.setViewName("client/member/pswHPEmailCode");     //뷰의이름
         mv.addObject("dice", dice);
         mv.addObject("hospitalEmail", hospitalEmail);
         
         //System.out.println("mv : "+mv);

         response_email.setContentType("text/html; charset=UTF-8");
         PrintWriter out_email = response_email.getWriter();
         out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
         out_email.flush();
         
         
         return mv;
         
     }
	@RequestMapping("/HPPswInjeungNumChk.do")
    public ModelAndView injeungNumberChk(@RequestParam("hospitalEmail") String hospitalEmail,
    								 @RequestParam("injeungNum") String injeungNum, 
    								 @RequestParam("pswcode") String pswcode, 
            HttpServletResponse response_equals, ModelAndView mv) throws IOException{
    
		/*
		 * System.out.println("마지막 : injeungNum : "+injeungNum);
		 * 
		 * System.out.println("마지막 : pswcode : "+pswcode);
		 * System.out.println("마지막 : memberEmail : "+memberEmail);
		 */
	    
//	    mv.setViewName("client/member/changeHPPsw");
//	    mv.addObject("hospitalEmail",hospitalEmail);
    
	    if (injeungNum.equals(pswcode)) {
	        //pswcode : 내가 쓴 인증번호
	        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 비밀번호 변경창으로 이동시킨다
	    
	        mv.setViewName("client/member/changeHPPsw");
	        mv.addObject("hospitalEmail",hospitalEmail);
	        
	        //만약 인증번호가 같다면 이메일을 비밀번호 변경 페이지로 넘기고, 활용할 수 있도록 한다.
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
	        out_equals.flush();
	
	        return mv;
	        
	        
	    }else if (injeungNum != pswcode) {
	        
	        
	        ModelAndView mv2 = new ModelAndView(); 
	        
	        mv2.setViewName("client/member/pswHPEmailCode");
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
	        out_equals.flush();
	        
	
	        return mv2;
	        
	    }    
	
	    return mv;
	
	}
	
	//변경할 비밀번호를 입력한 후에 확인 버튼을 누르면 넘어오는 컨트롤러
    @RequestMapping("/hpPswChange")
    public String changePsw(@RequestParam("hospitalEmail") String hospitalEmail,
    								@RequestParam("pswchange") String pswchange,
    								HospitalMember m, Model model,
    								@RequestParam Map<String,Object> map,
    								HttpServletResponse pass) throws Exception{
                
    String memberPsw = pswchange;
    String memberEmail = hospitalEmail;
  //  System.out.println("시작"+memberPsw);
  //  System.out.println(memberId + "끝");
    
 

    m.setPassword(pwEncoder.encode(memberPsw));
    m.setManagerEmail(memberEmail);

    //값을 여러개 담아야 하므로 해쉬맵을 사용해서 값을 저장함
    

    map.put("memberEmail", m.getManagerEmail());
    map.put("memberPsw", m.getPassword());
    
    int result = service.changeHPMemberPsw(map);
	System.out.println(result);
	
		/*
		 * pass.setContentType("text/html; charset=UTF-8"); PrintWriter out_equals =
		 * pass.getWriter(); if(result > 0) {
		 * out_equals.println("<script>alert('비밀번호 변경 완료! 로그인 후 이용하세요^^');</script>");
		 * out_equals.flush(); }else {
		 * out_equals.println("<script>alert('비밀번호 변경 실패! 다시 시도하세요@');</script>");
		 * out_equals.flush(); }
		 */
	
	String msg=""; 
	String loc="/";
	  
	  if(result>0) {
		  msg="비밀번호 변경 완료! 로그인 후 이용하세요^^"; 
		  
	  }else {
		 msg="비밀번호 변경 실패! 다시 시도하세요";  
	  } 
	  model.addAttribute("msg",msg);
	  model.addAttribute("loc",loc); 
	  
    return "client/common/msg";
                
    }
	//메인 - 병원카운트
	@RequestMapping("/member/hospitalCount.do")
	private ModelAndView hospitalCount(ModelAndView mv) {
		
		int hospitalCount=service.hospitalCount();
		logger.debug("hospitalCount :"+hospitalCount);
		
		mv.addObject("hospitalCount",hospitalCount);
		mv.setViewName("jsonView");
		return mv;
	}
	
}
