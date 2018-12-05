package com.example.school.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

/**
 * @ClassName HandleConfig
 * @Description TODO 配置视频播放路径
 * @Author 
 * @Date 
 * @Version 1.0
 **/
@Configuration
public class HandleConfig extends WebMvcConfigurationSupport {

    private static final String PUBLIC_PATH = "classpath:/public/";
    private static final String STATIC_PATH = "classpath:/static/";

    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/admin/**")
                .addResourceLocations(PUBLIC_PATH);
        registry.addResourceHandler("/**")
                .addResourceLocations(STATIC_PATH);

        super.addResourceHandlers(registry);
    }
}
