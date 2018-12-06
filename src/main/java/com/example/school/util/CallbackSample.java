package com.example.school.util;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.BucketReferer;
import com.aliyun.oss.model.OSSObject;
import com.aliyun.oss.model.PutObjectResult;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @ClassName CallbackSample
 * @Description TODO 上传文件到阿里OSS服务器上 , 加入防盗链
 * @Author 
 * @Date 
 * @Version 1.0
 **/

@Service
public class CallbackSample {

    private static final String END_POINT  = "oss-cn-beijing.aliyuncs.com";
    private static final String ACCESS_KEY_ID  = "LTAIsAPAnAV1YgIf";
    private static final String ACCESS_KEY_SECRET  = "WjJsMAGTlYHfdxjyvREAITnU0VQXPd";
    private static final String BUCKET_NAME  = "netschool";


    /**
     *
     * TODO: 文件上传接口
     * @param:
     * @return:
     * @author:
     * @version 1.0
     * @date: 
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
     * @author:
     * @version 1.0
     * @date: 
     */

    public String imageUpload(MultipartFile multipartFile) throws IOException {

        // 设置白名单
//        List<String> strings = new ArrayList<>();
//        strings.add("http://47.105.96.18:8080");


        OSSClient ossClient = new OSSClient(END_POINT, ACCESS_KEY_ID, ACCESS_KEY_SECRET);
        long newFileName = System.currentTimeMillis();

        Integer suffix = Objects.requireNonNull(multipartFile.getOriginalFilename()).lastIndexOf(".");
        String suffixName = multipartFile.getOriginalFilename().substring(suffix);
        suffixName ="image/" + newFileName  + suffixName;

//        BucketReferer bucketReferer = new BucketReferer(true,strings);
        BucketReferer bucketReferer = new BucketReferer();

        ossClient.setBucketReferer(BUCKET_NAME,bucketReferer);
        ossClient.putObject(BUCKET_NAME, suffixName ,multipartFile.getInputStream());


        ossClient.shutdown();
        return "https://netschool.oss-cn-beijing.aliyuncs.com/" + suffixName;

    }

}
