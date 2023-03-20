package com.yuchen.controller;/*
    @author yuchen
    @create -- 
*/

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("Oauth")
@RestController
public class OauthController {
    @RequestMapping("/test")
    public String test(){
        return "yuchen";
    }
}
