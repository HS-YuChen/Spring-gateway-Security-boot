package com.yuchen;/*
    @author yuchen
    @create -- 
*/

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableFeignClients
public class TestApplication {
    public static void main(String[] args) {
        SpringApplication.run(TestApplication.class,args);
        System.out.println("test服务已启动");
    }
}
