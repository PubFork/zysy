package com.example.school.config.shiro;

import com.example.school.service.UserService;
import com.example.school.pojo.User;
import com.example.school.service.UserServiceImpl;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

/**
 * @ClassName MyShiroRealm
 * @Description TODO : 自定义权限认证
 * @Author
 * @Date
 * @Version 1.0
 **/

public class MyShiroRealm extends AuthorizingRealm {

	@Autowired
	private UserServiceImpl userService;
	/*
	 * @Autowired private RoleService roleService;
	 * 
	 * @Autowired private PermissionService permissionService;
	 */

	/**
	 *
	 * TODO:身份校验
	 * 
	 * @param:
	 * @return:
	 * @author:
	 * @version 1.0
	 * @date:
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
			throws AuthenticationException {
		String username = (String) authenticationToken.getPrincipal();
		User user = userService.findUserByName(username);
		if (user == null) {
			return null;
		}
		return new SimpleAuthenticationInfo(user, user.getUserpassword(), ByteSource.Util.bytes(username), getName());
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		User user = (User) principalCollection.getPrimaryPrincipal();
		Set<String> roles = userService.queryRoleByUserId(user.getUserid());
		authorizationInfo.setRoles(roles);
		Set<String> permissions = userService.queryPermissionByUserId(user.getUserid());
		authorizationInfo.setStringPermissions(permissions);
		return authorizationInfo;
	}

}
