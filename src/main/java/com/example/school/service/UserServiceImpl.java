package com.example.school.service;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.school.mapper.UserMapper;
import com.example.school.pojo.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	/**
	 * @author 祝靖雯 根据用户名查找用户
	 */
	@Override
	public User findUserByName(String username) {

		return userMapper.findUserByName(username);
	}

	/**
	 * @author 祝靖雯 根据用户Id查找角色名称
	 */

	@Override
	public Set<String> queryRoleByUserId(Integer userid) {

		return userMapper.queryRoleByUserId(userid);
	}

	/**
	 * @author 祝靖雯 根据用户Id查找权限
	 */
	@Override
	public Set<String> queryPermissionByUserId(Integer userid) {

		return userMapper.queryPermissionByUserId(userid);
	}
	/**
	 * @author 祝靖雯   用户注册
	 */

	@Override
	public boolean registerUserByNameAndPass(String username, String password) {
		ByteSource salt = ByteSource.Util.bytes(username);
		password = new SimpleHash("md5", password, salt, 5).toHex();
		try {
		    // 判断用户名是否存在
		    User user = userMapper.findUserByName(username);
		    if(user==null){
                userMapper.registerUserByNameAndPass(username, password);
                return true;
            }
		    return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 修改用户信息
	 * */
	public int updateById(User record) {

		return userMapper.updateById(record);
	}

	/**
	 * 根据用户Id查询密码
	 * @param id 要修改的用户id
	 * */
  	public User selUserById(Integer userId){
  		
		return userMapper.selUserById(userId);
  		
  		
  	}
	/**
	 * 根据用户Id修改密码
	 * @param id 要修改的用户id
	 * @author 杨婷
	 * */
	public int changePassWord(Integer userId, String userPassWord,@Param("newPassWord")String newPassWord) {
		
		return userMapper.changePassWord(userId, userPassWord, newPassWord);
	}
	/**
	 * 根据用户Id查询所有信息
	 * @param id 要修改的用户id
	 * @author 杨婷
	 * */
	public List<User> selectById(Integer userId) {
		
		return userMapper.selectById(userId);
	}
	
}
