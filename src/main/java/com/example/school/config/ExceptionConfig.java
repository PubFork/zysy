package com.example.school.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @ClassName ExceptionConfig
 * @Description TODO 全局异常处理类
 * @Author 
 * @Date 
 * @Version 1.0
 **/

//@ControllerAdvice
public class ExceptionConfig {

    @ExceptionHandler(Exception.class)
    public String exception(){
        return "error.html";
    }

    @ExceptionHandler(RuntimeException.class)
    public String runtime(){
        return "error.html";
    }

}
