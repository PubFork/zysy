package com.example.school.monitor.controller;

import com.example.school.pojo.Video;
import com.example.school.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {

    private final VideoService videoService;
    private final HttpSession session;

    @Autowired
    public IndexController(VideoService videoService, HttpSession session) {
        this.videoService = videoService;
        this.session = session;
    }

    private void init(){
        // 加载动漫
        List<Video> videos = videoService.queryVideoByCatAndLimitOrderByDateDesc("动漫",8);
        session.setAttribute("video",videos);
        // 按照播放量排序
        List<Video> bulletin = videoService.queryVideoByCatAndLimitOrderByPlaySumDesc("动漫",11);
        session.setAttribute("bulletin",bulletin);
    }

    @GetMapping("/")
    public String index() {
        init();
        return "page/index";
    }


}
