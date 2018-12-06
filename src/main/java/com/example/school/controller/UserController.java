package com.example.school.controller;

import com.example.school.service.UserServiceImpl;
import com.example.school.util.Json;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.school.pojo.User;
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
	public String register_do(String username, String password, Model model) {
		boolean flag = userService.registerUserByNameAndPass(username, password);
		if (flag) {
			return "login.html";
		} else {
			model.addAttribute("msg", "注册失败");
			return "register.html";
		}

	}

	/**
	 * @author: 祝靖雯 管理员登录
	 */
	@RequestMapping("/login_do")
	@ResponseBody
	public Json login(User user) {
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getUserpassword());
		Json json;
		try {
			subject.login(token);
			json = new Json(200, 0, null, "登录成功");
		} catch (IncorrectCredentialsException e) {
			json = new Json(500, 0, null, "密码输入错误!!!");
		} catch (LockedAccountException e) {
			json = new Json(500, 0, null, "账号已被冻结");
		} catch (AuthenticationException e) {
			json = new Json(500, 0, null, "用户名不存在");
		}
		return json;
	}

}
