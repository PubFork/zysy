package com.example.school.config.system;

import com.example.school.service.impl.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.List;

@Component
public class SystemStartInit implements CommandLineRunner {

    private final ServletContext application;
    private final VideoServiceImpl videoService;
    @Autowired
    public SystemStartInit(ServletContext application, VideoServiceImpl videoService) {
        this.application = application;
        this.videoService = videoService;
    }

    @Override
    public void run(String... args) throws Exception {
        System.out.println("--------------------系统开始初始化-------------------------------");
        application.setAttribute("CDN", "http://localhost:8080/");
        System.out.println("--------------------加载动漫信息-------------------------------");
        System.out.println("--------------------系统初始化完成-------------------------------");
    }
}
