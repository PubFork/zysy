package com.example.school.config.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;

@Component
public class SystemStartInit implements CommandLineRunner {

    @Autowired
    private ServletContext application;

    @Override
    public void run(String... args) throws Exception {
        System.out.println("--------------------系统开始初始化-------------------------------");
        application.setAttribute("CDN","http://localhost:8080/");
        System.out.println("--------------------系统初始化完成-------------------------------");
    }
}
