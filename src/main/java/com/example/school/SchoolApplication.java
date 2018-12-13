package com.example.school;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


/**
 * @param:
 * @return:
 * @author: 
 * @version 1.0
 * @date: 
 */
@SpringBootApplication
@MapperScan("/com.example.school.mapper")
public class SchoolApplication {
    // 祝靖雯
    public static void main(String[] args) {
        SpringApplication.run(SchoolApplication.class, args);
    }
}

