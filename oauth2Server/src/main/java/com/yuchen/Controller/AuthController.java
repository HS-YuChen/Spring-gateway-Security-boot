package com.yuchen.Controller;/*
    @author yuchen
    @create -- 
*/

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/oauth")
@RestController
public class AuthController {

    @RequestMapping("/token")
    public String token(){

        return null;
    }
}
