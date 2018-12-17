package com.example.school.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

import com.example.school.pojo.Video;
import com.example.school.service.VideoService;
import com.example.school.util.ShiroUtil;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.BucketReferer;
import com.example.school.pojo.User;

//@Controller
//@RequestMapping("/video")
public class UpVideoController {

    private static final String END_POINT = "oss-cn-beijing.aliyuncs.com";
    private static final String ACCESS_KEY_ID = "LTAIsAPAnAV1YgIf";
    private static final String ACCESS_KEY_SECRET = "WjJsMAGTlYHfdxjyvREAITnU0VQXPd";
    private static final String BUCKET_NAME = "netschool";

    @Autowired
    private VideoService videoService;

    /**
     * zjw
     *
     * @param file 上传文件
     * @throws IOException 文件上传异常
     */
    public static String upload(MultipartFile file) throws IOException {

        if(file == null){
            return null;
        }

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String data = simpleDateFormat.format(new Date());
        OSSClient ossClient = new OSSClient(END_POINT, ACCESS_KEY_ID, ACCESS_KEY_SECRET);
        String suffix = file.getOriginalFilename().substring(Objects.requireNonNull(file.getOriginalFilename()).lastIndexOf("."));
        String fileName = data + File.separator + System.currentTimeMillis() + suffix;
        System.out.println(fileName);
        BucketReferer bucketReferer = new BucketReferer();
        ossClient.setBucketReferer(BUCKET_NAME, bucketReferer);
        ossClient.putObject(BUCKET_NAME, fileName, file.getInputStream());
        ossClient.shutdown();
        return "https://netschool.oss-cn-beijing.aliyuncs.com/" + fileName;
    }

    @PostMapping("/upload")
    public String insertVideo(MultipartFile file,
                              @RequestParam(value = "title" , required = false) String title , // 稿件标题
                              @RequestParam(value = "zone" , required = false) Integer zone , // 选择类别
                              @RequestParam(value = "description" , required = false) String description  // 简介
                              ) {

        User user = ShiroUtil.getUser();

        try {

            Video video = new Video();
            String path = upload(file);
            video.setVideoInfo(description); // 视频描述
            video.setVideoPicture(path);     // 视频地址
            video.setVideoName(title);       // 视频标题
            video.setVideoCategoryId(zone); // 视频类别
            video.setUserId(user.getUserId()); // 用户ID

            videoService.insertVideo(video);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("文件上传失败");
            return "upVideo.html";
        }
        return "thanksPost.html";
    }


}
