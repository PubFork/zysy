package com.example.school.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserChecksMapper {
	
	/**
	 * 签到之前查询状态
	 * @param userId
	 * @return
	 */
	public String selectState(Integer userId);
	
	/**
	 * 签到
	 * @param userId,userName
	 * @return
	 */
	public int userSign(@Param("userId")Integer userId,@Param("userName")String userName);
	
	/**
	 * 签到之后获取硬币
	 * @param userId
	 * @return
	 */
	public int addGold(@Param("userId")Integer userId,@Param("gold")Integer gold);

}
