package com.yuchen.feign;/*
    @author yuchen
    @create -- 
*/

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(value = "yuchen-oauth")
public interface TestFeign {
    @RequestMapping("/login")
    public String login();
}
