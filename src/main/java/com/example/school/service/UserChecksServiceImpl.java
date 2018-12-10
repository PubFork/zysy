package com.example.school.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.school.mapper.UserChecksMapper;
import com.example.school.service.UserChecksService;
@Service
public class UserChecksServiceImpl implements UserChecksService{
	@Autowired
	UserChecksMapper userChecksMapper;
	@Override
	public String selectState(Integer userId) {
		
		return userChecksMapper.selectState(userId);
	}
	@Override
	public int userSign(Integer userId, String userName) {
		
		return userChecksMapper.userSign(userId, userName);
	}
	@Override
	public int addGold(Integer userId,Integer gold) {
		
		return userChecksMapper.addGold(userId,gold);
	}

}
