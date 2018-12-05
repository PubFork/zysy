package com.example.school.service;

import java.util.Set;

import com.example.school.pojo.User;

public interface UserService {

	User findUserByName(String username);

	Set<String> queryRoleByUserId(Integer userid);

	Set<String> queryPermissionByUserId(Integer userid);

}
