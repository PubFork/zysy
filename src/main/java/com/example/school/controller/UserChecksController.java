package com.example.school.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.school.service.UserChecksService;
import com.example.school.util.Result;

//@RestController
//@RequestMapping("/UserChecks")
public class UserChecksController {
	
	private Map<String, Object> map=new HashMap<String, Object>();	
	@Autowired
	UserChecksService userChecksService;
	
	@RequestMapping("/selectState")
	public Object selectState(Integer userId) {
		
		String state = userChecksService.selectState(userId);
		
		if(state==null || state=="") {
			
			return new Result("未签到",0);		
		}
		return new Result(state,1);	
	}
	
	@RequestMapping("/userSign")
	public Object userSign(Integer userId,String userName,Integer gold) {
		
		int userSign = userChecksService.userSign(userId, userName);
		
		if(userSign>0) {
			
			map.put("success", true);
			
			map.put("message", "签到成功");
			
			userChecksService.addGold(userId, gold);
			
		}else{
			
			map.put("success", false);			
			
			map.put("message", "签到失败");
			
		}
		  
	       return map;
	}
	
	
}
