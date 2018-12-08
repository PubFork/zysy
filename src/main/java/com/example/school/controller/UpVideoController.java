package com.example.school.controller;

import java.io.IOException;
import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.BucketReferer;

@Controller
public class UpVideoController {
	
	private static final String END_POINT  = "oss-cn-beijing.aliyuncs.com";
    private static final String ACCESS_KEY_ID  = "LTAIsAPAnAV1YgIf";
    private static final String ACCESS_KEY_SECRET  = "WjJsMAGTlYHfdxjyvREAITnU0VQXPd";
    private static final String BUCKET_NAME  = "netschool";
	
    /**
     * @author: 祝靖雯
     * 上传文件
     */

    public String fileUpload(MultipartFile multipartFile , long belongId) throws IOException {

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

    }
    
    
    /**
    *
    * TODO: 图片上传,地址
    * @param: 上传文件对象
    * @return: 文件远程地址
    * @author: 樊立扬
    * @version 1.0
    * @date: 2018/10/7 9:57
    */

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
       return "https://netschool.oss-cn-beijing.aliyuncs.com/" + suffixName;

   }

}
