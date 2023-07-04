package com.yuchen.controller;/*
    @author yuchen
    @create -- 
*/

import com.yuchen.feign.TestFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("Oauth")
@RestController
public class OauthController {
    @Autowired
    public TestFeign testFeign;

    @RequestMapping("/test")
    public String test(){
        return testFeign.login();
    }

}
