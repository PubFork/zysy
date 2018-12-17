package com.example.school.controller;

import com.example.school.service.impl.UserServiceImpl;
import com.example.school.util.PasswordEncoder;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.school.pojo.User;

//@Controller
//@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserServiceImpl userService;

	Map<String, Object> map = new HashMap<String, Object>();

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
	public Object login(User user, Model model) {

		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getUserPassWord());
		System.err.println(token);
		/* model.addAttribute ("data",subject.getPrincipal()); */
		try {
			subject.login(token);
			User u = (User) subject.getPrincipal();
			map.put("success", true);
			map.put("msg", u);
			map.put("role", userService.queryRoleByUserId(u.getUserId()));

		} catch (Exception e) {
			map.put("success", false);
			map.put("msg", "账号或者密码错误");

		}
		return map;
	}
	
	/**
	 * @author 杨婷   查询用户信息
	 * @param id  要查询的用户id
	 */
	@RequestMapping("/selectById")
	@ResponseBody
	public Object selectById(Integer userId){
		
		List<User> list  =  userService.selectById(userId);
		
		return list;
		
		
	}

	/**
	 * @author 杨婷   修改用户信息
	 * @param id  要修改的用户id
	 * @return 结果 0：修改失败 1：修改成功
	 * @throws ParseException
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> updateById(Integer userId,String userName, String sex, String marry, String userTelephone,
			String address, Integer birthyear, Integer birthmonth, Integer birth) throws ParseException {

		SimpleDateFormat str = new SimpleDateFormat("yyyy-MM-dd");

		String string = birthyear + "-" + birthmonth + "-" + birth;

		Date strDate = str.parse(string);
		String birthday = str.format(strDate);
		// System.out.println(str.format(string));

		User user = new User();
		user.setUserId(userId);
		user.setUserName(userName);
		user.setSex(sex);
		user.setMarry(marry);
		user.setBirthday(birthday);
		user.setUserTelephone(userTelephone);
		user.setAddress(address);

		//System.out.println("userName" + userName);
		int us = userService.updateById(user);

		if (us > 0) {

			map.put("success", true);
			map.put("message", "保存成功");

		} else {

			map.put("success", false);
			map.put("message", "保存失败");
		}
		return map;

	}
	@RequestMapping("/changepwd")
	@ResponseBody
	public Object changePassWord(Integer userId,String userPassWord,String newPassWord){
		
		
		//UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getUserPassWord());

		String oldPassWord  = userService.selUserById(userId).getUserPassWord();
		
		String name = userService.selUserById(userId).getUserName();
		
		PasswordEncoder encoder = new PasswordEncoder(name,"MD5");
		
		String encoderPass = encoder.encode(userPassWord,5);// 用户名做盐,哈希五次MD5加密
   
		newPassWord = encoder.encode(newPassWord,5);//用户名做盐,哈希五次MD5加密
		
		if(!oldPassWord.equals(encoderPass)) {
			
			map.put("success", true);
			map.put("message", "修改成功");
			
		}else {
			
			map.put("success", false);
			map.put("message", "修改失败");
			
		}
		return map;
	
	}
	
	/**
	 * @author 杨婷   跳转个人中心首页
	 * 
	 */
	@RequestMapping("/personalCenter")
	public String personalCenter() {

		return "personalCenter.html";
	}
    
	/**
	 * @author 杨婷   跳转首页
	 * 
	 */
	@RequestMapping(value = { "/index" })
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

	/**
	 * @author 杨婷   跳转设置页面
	 * 
	 */
	@RequestMapping("/information")
	public String information() {

		return "information.html";
	}
	/**
	 * @author 杨婷   跳转我的头像
	 * 
	 */
	@RequestMapping("/myHead")
	public String myHead() {

		return "myHead.html";
	}
	
	

	@RequestMapping("/upVideo")
	public String upVideo() {

		return "upVideo.html";
	}

	@RequestMapping("/notice")
	public String notice() {

		return "notice.html";
	}

	@RequestMapping("/post")
	public String post() {

		return "post.html";
	}

	/**
	 * @author 杨婷   跳转安全管理页面
	 * 
	 */
	@RequestMapping("/changePassWord")
	public String changePassWord() {

		return "changePassWord.html";
	}

	@RequestMapping("/thankspost")
	public String thankspost() {

		return "thanksPost.html";
	}

}
