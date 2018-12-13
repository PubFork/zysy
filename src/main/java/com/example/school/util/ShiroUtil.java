package com.example.school.util;

import com.example.school.pojo.User;
import org.apache.shiro.SecurityUtils;

import java.util.Optional;

/**
 * @ClassName ShiroUtil
 * @Description TODO
 * @Author 
 * @Date 
 * @Version 1.0
 **/

public class ShiroUtil {

    public static User getUser(){
        return (User) SecurityUtils.getSubject().getPrincipal();
    }

}
