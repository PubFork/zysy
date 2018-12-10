package com.example.school.controller;

import java.io.IOException;
import java.util.Objects;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.BucketReferer;
import com.example.school.pojo.User;

@Controller
@RequestMapping("/video")
public class UpVideoController {
	
	private static final String END_POINT  = "oss-cn-beijing.aliyuncs.com";
    private static final String ACCESS_KEY_ID  = "LTAIsAPAnAV1YgIf";
    private static final String ACCESS_KEY_SECRET  = "WjJsMAGTlYHfdxjyvREAITnU0VQXPd";
    private static final String BUCKET_NAME  = "netschool";
	
    /**
     * @author: 祝靖雯
     * 上传文件
     * @param belongId 视频分类
     */

/*  
    public String fileUpload(MultipartFile multipartFile , long belongId) throws IOException {

    	// shiro完成登录之后，获取用户信息
    	User user = (User) SecurityUtils.getSubject().getPrincipal();
    	
        // 设置白名单
//        List<String> strings = new ArrayList<>();
//        strings.add("http://47.105.96.18:8080");


        OSSClient ossClient = new OSSClient(END_POINT, ACCESS_KEY_ID, ACCESS_KEY_SECRET);
        long newFileName = System.currentTimeMillis();

//        BucketReferer bucketReferer = new BucketReferer(true,strings);

        BucketReferer bucketReferer = new BucketReferer();

        String suffixName = belongId + "/" + multipartFile.getOriginalFilename() ;

        ossClient.setBucketReferer(BUCKET_NAME,bucketReferer);
        ossClient.putObject(BUCKET_NAME,  suffixName ,multipartFile.getInputStream());


        ossClient.shutdown();
        return "https://netschool.oss-cn-beijing.aliyuncs.com/" + suffixName;

    }*/
    
    
    /**
    *
    * TODO: 图片上传,地址
    * @param: 上传文件对象
    * @return: 文件远程地址
    * @author: zjw
    * @version 1.0
    * @date: 
    */
    @PostMapping("/upload")
   public String imageUpload(MultipartFile multipartFile) throws IOException {

       // 设置白名单
//       List<String> strings = new ArrayList<>();
//       strings.add("http://47.105.96.18:8080");


       OSSClient ossClient = new OSSClient(END_POINT, ACCESS_KEY_ID, ACCESS_KEY_SECRET);
       long newFileName = System.currentTimeMillis();

       Integer suffix = Objects.requireNonNull(multipartFile.getOriginalFilename()).lastIndexOf(".");
       String suffixName = multipartFile.getOriginalFilename().substring(suffix);
       suffixName ="image/" + newFileName  + suffixName;

//       BucketReferer bucketReferer = new BucketReferer(true,strings);
       BucketReferer bucketReferer = new BucketReferer();

       ossClient.setBucketReferer(BUCKET_NAME,bucketReferer);
       ossClient.putObject(BUCKET_NAME, suffixName ,multipartFile.getInputStream());


       ossClient.shutdown();
       System.out.println("https://netschool.oss-cn-beijing.aliyuncs.com/" + suffixName);
       return "thankspost.html";

   }

}
