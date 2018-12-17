package com.example.school.config.shiro;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @ClassName ShiroConfiguration
 * @Description TODO : shiro 自定义URL拦截规则
 * @Author
 * @Date
 * @Version 1.0
 **/

@Configuration
public class ShiroConfiguration {

	/**
	 * @author: 祝靖雯 shiro与thymeleaf(模板引擎)的结合
	 */

	@Bean
	public ShiroDialect shiroDialect() {
		return new ShiroDialect();
	}

	/**
	 * @author: 祝靖雯 shiro缓存管理器
	 */
	/*@Bean
	public EhCacheManager ehCacheManager() {
		EhCacheManager cacheManager = new EhCacheManager();
		cacheManager.setCacheManagerConfigFile("classpath:config/ehcache-shiro.xml");
		return cacheManager;
	}*/

	/**
	 * @author: 祝靖雯 自定义拦截规则
	 */

	@Bean
	public ShiroFilterFactoryBean shiroFilter(SecurityManager securityManager) {
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		shiroFilterFactoryBean.setSecurityManager(securityManager);
		Map<String, String> defaultFilterMap = new LinkedHashMap<>();

		//defaultFilterMap.put("/logout", "logout");
		// 放行静态资源

//		defaultFilterMap.put("/css/**", "anon");
//		defaultFilterMap.put("/img/**", "anon");
//		defaultFilterMap.put("/images/**", "anon");
//		defaultFilterMap.put("/fonts/**", "anon");
//		defaultFilterMap.put("/lib/**", "anon");
//		defaultFilterMap.put("/js/**", "anon");
//		defaultFilterMap.put("/admin/login", "anon");
//		defaultFilterMap.put("/", "anon");
//		defaultFilterMap.put("/index", "anon");
//		defaultFilterMap.put("/register", "anon");
//
//		defaultFilterMap.put("/user/login_do", "anon");
//		defaultFilterMap.put("/user/register_do", "anon");
//		defaultFilterMap.put("/admin/adminLogin", "anon");
//		shiroFilterFactoryBean.setLoginUrl("/user/login");
//		shiroFilterFactoryBean.setUnauthorizedUrl("/user/login");

        defaultFilterMap.put("/**","anon");

		shiroFilterFactoryBean.setFilterChainDefinitionMap(defaultFilterMap);
		return shiroFilterFactoryBean;
	}

	@Bean
	public SecurityManager securityManager() {
		DefaultWebSecurityManager defaultSecurityManager = new DefaultWebSecurityManager();
		defaultSecurityManager.setRealm(myShiroRealm());
		//defaultSecurityManager.setCacheManager(ehCacheManager());
		// defaultSecurityManager.setRememberMeManager(cookieRememberMeManager());
		return defaultSecurityManager;
	}

	/**
	 * @author 加载自定义Realm
	 * @return
	 */
	@Bean
	public MyShiroRealm myShiroRealm() {
		MyShiroRealm myShiroRealm = new MyShiroRealm();
		myShiroRealm.setCredentialsMatcher(hashedCredentialsMatcher());
		return myShiroRealm;
	}

	/**
	 * @author 祝靖雯
	 * md5加密
	 */
	@Bean
	public HashedCredentialsMatcher hashedCredentialsMatcher() {
		HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
		hashedCredentialsMatcher.setHashAlgorithmName("md5");
		hashedCredentialsMatcher.setHashIterations(5);
		return hashedCredentialsMatcher;
	}

}
