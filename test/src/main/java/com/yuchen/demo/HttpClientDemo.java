package com.yuchen.demo;/*
    @author yuchen
    @create -- 
*/


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("httpClient")
public class HttpClientDemo {

    @GetMapping("testControllerYuchen")
    public String testControllerYuchen(){
        return "";

    }
}
