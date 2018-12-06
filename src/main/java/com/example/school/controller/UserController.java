package com.example.school.controller;

import com.example.school.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.school.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserServiceImpl userService;

	@GetMapping("/login")
	public String toLogin() {

		return "login.html";
	}

	@GetMapping("/register")
	public String register() {

		return "register.html";
	}

	@RequestMapping("/register_do")
	public String register_do(String username, String password,Model model) {
		boolean flag = userService.registerUserByNameAndPass(username, password);
		if (flag) {
			return "login.html";
		} else {
			model.addAttribute("msg","注册失败");
			return "register.html";
		}
	}

}
