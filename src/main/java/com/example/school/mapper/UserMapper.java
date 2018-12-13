package com.example.school.mapper;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.school.pojo.User;

@Mapper
@Repository
public interface UserMapper {
	
	User findUserByName(@Param("name")String username);
	
	Set<String> queryRoleByUserId(@Param("userId")Integer userid);
	
	Set<String> queryPermissionByUserId(@Param("userId")Integer userid);
	
	int registerUserByNameAndPass(@Param("username")String username,@Param("password") String password);

	/**
	 * 根据用户Id查询所有信息
	 * @param id 要修改的用户id
	 * 
	 * */
	List<User> selectById(Integer userId);
	/**
	 * 修改用户信息
	 * @param id 要修改的用户id
	 * @return 结果　０：修改失败　　１：修改成功
	 * */
	int updateById(User record);
	/**
	 * 修改用户密码
	 * @param id 要修改的用户id
	 * @return 结果　０：修改失败　　１：修改成功
	 * */
    int changePassWord(@Param("userId")Integer userId,@Param("userPassWord")String userPassWord,@Param("newPassWord")String newPassWord);

    /**
	 * 根据用户Id查询密码
	 * @param id 要修改的用户id
	 * */
  	public User selUserById(Integer userId);
}
