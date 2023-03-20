package com.yuchen.controller;/*
    @author yuchen
    @create -- 
*/

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class DemoController {
    @RequestMapping("/getYuchen")
    public String getYuchen(){
        return "yuchen";
    }
}
