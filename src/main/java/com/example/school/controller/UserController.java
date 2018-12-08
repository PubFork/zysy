package com.example.school.controller;

import com.example.school.service.UserServiceImpl;
import com.example.school.util.Json;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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

	Map<String,Object> map = new HashMap<String,Object>();
	
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
	public String login(User user , Model model) {
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getUserPassWord());
		System.err.println(token);
		try {
			subject.login(token);
			return "index.html";
		} catch (Exception e) {
		    model.addAttribute("msg","账号或者密码错误");
		    return "login.html";
		}
	}
	
	
	/**
	 * 修改用户信息
	 * @param id 要修改的用户id
	 * @return 结果　０：修改失败　　１：修改成功
	 * @throws ParseException 
	 * */
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,Object> updateById(String userName,String sex,String marry,String userTelephone,String address,Integer birthyear,Integer birthmonth,Integer birth) throws ParseException{
		
		SimpleDateFormat str=new SimpleDateFormat("yyyy-MM-dd");
		
		String string=birthyear+"-"+birthmonth+"-"+birth;
		
		Date strDate=str.parse(string);
		String birthday = str.format(strDate);
		//System.out.println(str.format(string));
		
		User user = new User();
		user.setUserName(userName);
		user.setSex(sex);
		user.setMarry(marry);
		user.setBirthday(birthday);
		user.setUserTelephone(userTelephone);
		user.setAddress(address);
		
		System.out.println("userName"+userName);
		int us = userService.updateById(user);
		
		if(us>0){
			
			
			map.put("success",true);
			map.put("message", "保存成功");
			
		}else {
			
			map.put("success",false);
			map.put("message", "保存失败");
		}
		return map;
		
		
	}
	@RequestMapping("/personalCenter")
	public String personalCenter() {
		
		return "personalCenter.html";
	}
	
	@RequestMapping(value= {"/index"})
	public String index() {
		
		return "index.html";
	}
	
	@GetMapping("/logout")
	public String logout() {
		SecurityUtils.getSubject().logout();
		return "/login.html";
	}
	
	@RequestMapping("/findpass")
	public String findpass() {
		
		return "findpass.html";
	}
	@RequestMapping("/information")
	public String information() {
		
		return "information.html";
	}

}
