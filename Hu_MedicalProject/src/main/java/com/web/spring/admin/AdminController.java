package com.web.spring.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("/admin/admin.do")
	public String admin() {
		return "admin/adminIndex";
	}

	@RequestMapping("/admin/member.do")
	public String member(){
		return "admin/test";
	}
}
