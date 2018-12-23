package com.example.school.monitor.controller;

import com.example.school.monitor.business.VideoCategoryService;
import com.example.school.pojo.Video;
import com.example.school.pojo.VideoCategory;
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
    private final VideoCategoryService videoCategoryService;


    @Autowired
    public IndexController(VideoService videoService, HttpSession session, VideoCategoryService videoCategoryService) {
        this.videoService = videoService;
        this.session = session;
        this.videoCategoryService = videoCategoryService;
    }

    private void init(){
        // 加载动漫
        List<Video> videos = videoService.queryVideoByCatAndLimitOrderByDateDesc("动漫",8);
        session.setAttribute("video",videos);

        //加载影视
        List<Video> movie = videoService.queryVideoByCatAndLimitOrderByDateDesc("影视",8);
        session.setAttribute("movie",movie);
        System.out.println(movie);

        //加载投稿
        List<Video> post = videoService.queryVideoByCatAndLimitOrderByDateDesc("投稿",8);
        session.setAttribute("post",post);

        // 按照播放量排序
        List<Video> bulletin = videoService.queryVideoByCatAndLimitOrderByPlaySumDesc("动漫",11);
        session.setAttribute("bulletin",bulletin);

        // 加载动漫分类
        List<VideoCategory> videoCategories = videoCategoryService.queryVideoCategoryByParentId("动漫");
        session.setAttribute("videoCategories",videoCategories);
        List<VideoCategory> movieCategories = videoCategoryService.queryVideoCategoryByParentId("影视");
        session.setAttribute("movieCategories",movieCategories);
        List<VideoCategory> postCategories = videoCategoryService.queryVideoCategoryByParentId("投稿");
        session.setAttribute("postCategories",postCategories);

    }

    @GetMapping("/")
    public String index() {
        init();
        return "page/index";
    }


}
