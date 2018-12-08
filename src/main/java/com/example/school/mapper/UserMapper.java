package com.example.school.mapper;

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
	 * 修改用户信息
	 * @param id 要修改的用户id
	 * @return 结果　０：修改失败　　１：修改成功
	 * */
	int updateById(User record);
}
