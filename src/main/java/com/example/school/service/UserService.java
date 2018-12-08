package com.example.school.service;

import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.example.school.pojo.User;

public interface UserService {

	User findUserByName(String username);

	Set<String> queryRoleByUserId(Integer userid);

	Set<String> queryPermissionByUserId(Integer userid);

	boolean registerUserByNameAndPass(String username, String password);
	
	/**
	 * 修改用户信息
	 * 
	 * */
	int updateById(User record);
	/**
	 * 修改用户密码
	 * @param id 要修改的用户id
	 * @return 结果　０：修改失败　　１：修改成功
	 * */
    int changePassWord(@Param("userId")Integer userId,@Param("userPassWord")String userPassWord);

}
