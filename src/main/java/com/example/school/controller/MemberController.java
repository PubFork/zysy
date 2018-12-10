package com.example.school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@RequestMapping("/members")
	public String member() {
		
		return "member.html";
	}

}
