package com.example.school.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.school.mapper.UserMapper;
import com.example.school.pojo.User;

@Service
public class UserServiceimpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	/**
	 * @author 祝靖雯
	 * 根据用户名查找用户
	 */
	@Override
	public User findUserByName(String username) {

		return userMapper.findUserByName(username);
	}
	
	/**
	 * @author 祝靖雯
	 * 根据用户Id查找角色名称
	 */

	@Override
	public Set<String> queryRoleByUserId(Integer userid) {
		
		return userMapper.queryRoleByUserId(userid);
	}

	/**
	 * @author 祝靖雯
	 * 根据用户Id查找权限
	 */
	@Override
	public Set<String> queryPermissionByUserId(Integer userid) {
		
		return userMapper.queryPermissionByUserId(userid);
	}

}
