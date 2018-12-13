package com.example.school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @ClassName IndexController
 * @Description TODO
 * @Author 樊立扬
 * @Date 2018/12/13 21:51
 * @Version 1.0
 **/
@Controller
public class IndexController {

    @RequestMapping(value =  "/" )
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/admin/login")
    public String login(){
        return "admin/login";
    }

}
