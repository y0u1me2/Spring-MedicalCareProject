package com.web.spring.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.web.spring.common.EmailSender;
import com.web.spring.member.model.service.MemberService;
import com.web.spring.member.model.vo.Email;
import com.web.spring.member.model.vo.Member;


@Controller
@SessionAttributes(value= {"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService service;

	@Autowired
	private Logger logger;
	//암호화
	@Autowired
	private BCryptPasswordEncoder pwEncoder; //단방향 암호화 객체
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private Email email;
	
	@Autowired
	private EmailSender emailsender;

	@RequestMapping("/member/personEnroll.do")
	public String personEnroll() {
		return "client/member/personEnroll";
	}
	@RequestMapping("/member/hospitalEnroll.do")
	public String hospitalEnroll() {
		return "client/member/hospitalEnroll";
	}
	
	// 회원가입 + 이메일 인증////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/member/personEnrollEnd.do")
	   public String insertPerson(@RequestParam("email") String email,
									    @RequestParam("joinName") String name,
									    @RequestParam("password") String password,
									    @RequestParam("joinPhone") String phone,
									    HttpServletRequest request,Model model) throws Exception {
	
		  Member m = new Member(0,email,name,password,phone,null,null);
		  String userEmail = m.getEmail();
		  System.out.println(m);
	      logger.debug("암호화 전 : " + m.getPassword());
	      m.setPassword(pwEncoder.encode(m.getPassword()));
	      logger.debug("암호화 후 :" + m.getPassword());
	      
	      int result = service.insertPerson(m);
	      System.out.println(result);
	      
	      String host =request.getRequestURL().toString().replace(request.getRequestURI(),"")+request.getContextPath()+"/";
	      String msg="";
	      String loc="";
	      
			if(result > 0) {
				String setfrom = "qkrejrgus4713@gmail.com";
		        String tomail = m.getEmail();    //받는 사람의 이메일
		        String title = "HU 회원가입 인증 이메일 입니다.";    //제목
		        String content =
		               "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다."     
		             +
		               "<a href="+ host + "member/emailComplete.do?userEmail="+userEmail+">회원가입 인증하기</a>"; // 내용
		       
		        try {

		            MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

		            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
		            messageHelper.setTo(tomail); // 받는사람 이메일
		            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		            messageHelper.setText(content, true); // 메일 내용
		            
		            mailSender.send(message);
		    
		        } catch (Exception e) {
		            System.out.println(e);
		        }
		        msg = "이메일이 발송되었습니다. 이메일 인증을 해주세요!";
		       
			}else {
				  msg = "이메일 발송 실패, 다시 시도 해주세요";
	        	  loc= "client/member/personEnroll";
			}
			 model.addAttribute("msg", msg);
		     model.addAttribute("loc", loc);
			return "client/common/msg";
	   }
	
	   @RequestMapping("/member/emailComplete.do")
	    public String emailComplete(@RequestParam("userEmail") String email, Model model) {
	   
		   System.out.println(email);
		/*
		 * Member m = service.searchEmail(email); 
		 * System.out.println("나나" + m);
		 */
	       int join = service.emailComplete(email);
	       String msg = "";
	       String loc = "/";
	       
	       if(join > 0) {
	          msg = "이메일 인증 완료되었습니다. 로그인 후 이용하세요!";
	       }else{
	         msg = "이메일 인증 실패...";
	       }    
	       model.addAttribute("msg", msg);
	       model.addAttribute("loc", loc);
	        
	       return "client/common/msg";
	   }
	//////////////////////////////////////////////////////////////////////////////////////////////////////////// 
	   
	// 로그인 ////////////////////////////////////////////////////////////////////////////////////////////////////   
	@SuppressWarnings("unused")
	@RequestMapping("/member/memberLogin.do")
	 public String memberLogin(Member m, Model model) throws Exception{
		//System.out.println(m);

		logger.debug(""+m);
		Member loginMember = service.memberLogin(m);
		
		System.out.println(loginMember);
//		logger.debug("db : " + loginMember.getPassword());
//		logger.debug("param : " + pwEncoder.encode(m.getPassword()));
		 String msg = "";
		 String loc = "/";
		 
		 if(loginMember != null) {
			 if(pwEncoder.matches(m.getPassword(), loginMember.getPassword())) {
				 msg = "로그인 성공";
				 model.addAttribute("loginMember",loginMember);
			 }else {
				 msg="로그인 실패, 비밀번호를 확인하세요!";
			 }
		 }else{
				// 아이디가 일치하지 않음
				msg = "로그인 실패 아이디를 확인하세요";
		 }	 
		 model.addAttribute("msg", msg);
		 model.addAttribute("loc", loc);
	     
		 return "client/common/msg";
	 }
	
	// 구글 로그인  /////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/googleIdChk.do")
	public ModelAndView googleIdChk(@RequestParam("googleEmail") String googleEmail,
									@RequestParam("googleName") String googleName,
									@RequestParam("googlePW") String googlePW,
									ModelAndView mv,HttpServletRequest request) {
		System.out.println(googleEmail + googleName + googlePW);
		Member member = service.googleIdChk(googleEmail);
		
		Member googleNew=null;  //구글 새로운 로그인
		Member googleNewReal=null;  //구글 새로운 로그인
		Member googleOld=null; //구글 기존의 사용자
		Member googleLogin=null; //구글 로그인 해봤던 사람
		Member googleAccount=null; //구글 계정으로 가입한 사람
		Member m=null; //구글 계정으로 가입한 사람
		String loginResult="N";
		String memeberStatus=null;
		int num=0;
		int loginC=Integer.parseInt(request.getParameter("loginCount"));
		
		if(member == null) {	
			//google아이디로 회원가입 시켜줘야됌!
			googleNew = new Member(0,googleEmail,googleName, googlePW,null,null,null);
			System.out.println(googleNew);
			int result = service.googleInsert(googleNew);
			if(result>0) {
			googleNewReal = service.memberLogin(googleNew);
			memeberStatus=googleNewReal.getMemberStatus();
			m=googleNewReal;
			num=0;
			
			}
		}else {
			//이미 같은 이메일로 가입되어있음
			googleOld=service.searchGoogleGetMember(googleEmail);
			System.out.println(googleOld);
			if(googleOld.getPassword()==googlePW) {
				//구글로 로그인 한사람 비밀번호 같으면 구글로 로그인 실행
					googleLogin = service.memberLogin(googleOld);
					memeberStatus=googleLogin.getMemberStatus();
					m=googleLogin;
					num=1;
			}else {//구글로 가입했는데 구글로 로그인 한사람 비밀번호 다르면 구글로 가입한 계정으로 로그인
					googleAccount = service.memberLogin(googleOld);
					memeberStatus=googleAccount.getMemberStatus();
					m=googleAccount;	
					num=1;;
			}			
		}
		if (m != null&&memeberStatus.equals("Y")) {
			loginResult="Y";	
			
		}
		mv.addObject("loginMember", m);
		mv.addObject("num", num);
		mv.addObject("loginResult", loginResult);
		mv.addObject("memeberStatus", memeberStatus);
		mv.addObject("loginCount",loginC==1?1:10);
		mv.setViewName("jsonView");  
		return mv;
	}
	
	// 로그아웃 ////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/member/logout.do")
	public String logout(SessionStatus status,HttpServletResponse res) {
		if(!status.isComplete() == true) {
			status.setComplete(); //session을 종료
			//쿠키삭제
			Cookie c=new Cookie("careView", "0");
			c.setMaxAge(0);
			res.addCookie(c);
		}
		return "redirect:/";
	}
	
	
	// 아이디 찾기 ->  ////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/emailOk")
	public ModelAndView emailOk(@RequestParam("email") String email, ModelAndView mv) {
		System.out.println(email);
		
		Member member = service.searchEmail(email);
		Member leaveMember = service.leaveEmail(email);
		
		//String id = member.getEmail();
		//System.out.println(id);
		System.out.println(member);
		System.out.println(leaveMember);
		
		if(member != null && leaveMember == null) {
			mv.addObject("member",0);
			mv.setViewName("jsonView");
		}else if(member == null && leaveMember != null) {
			mv.addObject("member",1);
			mv.setViewName("jsonView");
		}else {
			mv.addObject("member",2);
			mv.setViewName("jsonView");
		}
		
		 return mv;
	}
	
	// 비밀번호 찾기 /////////////////////////////////////////////////////////////////////////////////////////////////
	//등록된 회원인지 검사
	@RequestMapping("/searchEmail")
	public ModelAndView searchEmail(@RequestParam String email, ModelAndView mv) {
		System.out.println(email);
		
		Member member = service.searchEmail(email);
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
	@RequestMapping("/findPass.do")
	public ModelAndView sendEmailAction(HttpServletRequest request,@RequestParam String memberEmail,
            HttpServletResponse response_email, ModelAndView mv) throws IOException {
		System.out.println(memberEmail);
		 Random r = new Random();
         int dice = r.nextInt(157211)+48271;
         
         String setfrom = "qkrejrgus4713@gmail.com";
         String tomail = memberEmail;    //받는 사람의 이메일
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
         
       
         mv.setViewName("client/member/pswEmailCode");     //뷰의이름
         mv.addObject("dice", dice);
         mv.addObject("memberEmail", memberEmail);
         
         System.out.println("mv : "+mv);

         response_email.setContentType("text/html; charset=UTF-8");
         PrintWriter out_email = response_email.getWriter();
         out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 확인해주세요!');</script>");
         out_email.flush();
         
         
         return mv;
         
     }
	@RequestMapping("/injeungNumChk.do")
    public ModelAndView injeungNumberChk(@RequestParam("memberEmail") String memberEmail,
    								 @RequestParam("injeungNum") String injeungNum, 
    								 @RequestParam("pswcode") String pswcode, 
            HttpServletResponse response_equals, ModelAndView mv) throws IOException{
    
		/*
		 * System.out.println("마지막 : injeungNum : "+injeungNum);
		 * 
		 * System.out.println("마지막 : pswcode : "+pswcode);
		 * System.out.println("마지막 : memberEmail : "+memberEmail);
		 */
	    
	    mv.setViewName("client/member/changePSW");
	    
	    mv.addObject("memberEmail",memberEmail);
    
	    if (injeungNum.equals(pswcode)) {
	        //pswcode : 내가 쓴 인증번호
	        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 비밀번호 변경창으로 이동시킨다
	    
	        mv.setViewName("client/member/changePSW");
	        
	        mv.addObject("memberEmail",memberEmail);
	        
	        //만약 인증번호가 같다면 이메일을 비밀번호 변경 페이지로 넘기고, 활용할 수 있도록 한다.
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
	        out_equals.flush();
	
	        return mv;
	        
	        
	    }else if (injeungNum != pswcode) {
	        
	        
	        ModelAndView mv2 = new ModelAndView(); 
	        
	        mv2.setViewName("client/member/pswEmailCode");
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 확인해주세요.'); history.back();</script>");
	        out_equals.flush();
	        
	
	        return mv2;
	        
	    }    
	
	    return mv;
	
	}
	
	//변경할 비밀번호를 입력한 후에 확인 버튼을 누르면 넘어오는 컨트롤러
    @RequestMapping("/pswChange")
    public String changePsw(@RequestParam("memberEmail") String memberEmail,
    								@RequestParam("pswchange") String pswchange,
    								Member m, Model model,
    								@RequestParam Map<String,Object> map,
    								HttpServletResponse pass) throws Exception{
                
    String memberPsw = pswchange;
    String memberId = memberEmail;
  //  System.out.println("시작"+memberPsw);
  //  System.out.println(memberId + "끝");
    
 

    m.setPassword(pwEncoder.encode(memberPsw));
    m.setEmail(memberId);

    //값을 여러개 담아야 하므로 해쉬맵을 사용해서 값을 저장함
    

    map.put("memberId", m.getEmail());
    map.put("memberPsw", m.getPassword());
    
    int result = service.changeMemberPsw(map);
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

    @RequestMapping("/findUserEmail.do")
    public ModelAndView findEmail(@RequestParam("userName") String name,
    							  @RequestParam("call") String phone,
    							  ModelAndView mv,Member m) {
		System.out.println(name);
		System.out.println(phone);
	
		Map<String,String> param = new HashMap<String,String>();
		param.put("name",name);
		param.put("phone",phone);
		
		String userMail = service.findEmail(param);
		
		System.out.println(userMail);
		if(userMail != null) {
			mv.addObject("userMail",userMail);
			mv.setViewName("jsonView");
		}else {
			mv.addObject("userMail",1);
			mv.setViewName("jsonView");
		}
		/*
		 * mv.addObject("userMail",userMail); mv.setViewName("jsonView");
		 */
		
		
		return mv;
    }
    

}
