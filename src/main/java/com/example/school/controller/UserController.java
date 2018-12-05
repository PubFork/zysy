package com.example.school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/login")
	public String toLogin() {

		return "login.html";
	}
	@GetMapping("/register")
	public String register() {

		return "register.html";
	}
}
