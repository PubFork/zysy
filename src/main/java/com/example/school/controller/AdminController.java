package com.example.school.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/adminLogin")
    public String AdminLogin(String userName, String passWord) {

        Subject subject = SecurityUtils.getSubject();

        UsernamePasswordToken token = new UsernamePasswordToken(userName, passWord);

        try {

            subject.login(token);
            return "admin/index";

        } catch (Exception e) {
            e.printStackTrace();
            return "vo/login";
        }

    }

}
