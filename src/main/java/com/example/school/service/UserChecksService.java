package com.example.school.service;

import org.apache.ibatis.annotations.Param;

public interface UserChecksService {
	
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
	public int userSign(Integer userId,String userName);
	
	/**
	 * 签到之后获取硬币
	 * @param userId
	 * @return
	 */
	public int addGold(Integer userId,Integer gold);
	
	

}
