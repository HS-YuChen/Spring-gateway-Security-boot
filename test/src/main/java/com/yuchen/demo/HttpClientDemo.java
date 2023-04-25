package com.yuchen.demo;/*
    @author yuchen
    @create -- 
*/


import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RequestMapping("httpClient")
@RestController
public class HttpClientDemo {

    @GetMapping("/testControllerYuchen")
    public String testControllerYuchen() throws IOException, ParseException {

        CloseableHttpClient httpClient = HttpClients.createDefault();
        String url = "http://172.16.32.99:8088";
        url += "/controller/yuchen";

        HttpPost httpPost = new HttpPost(url);

        String body = "雨晨调用第三方服务了，雨晨调用第三方服务了雨晨调用第三方服务了雨晨调用第三方服务了雨晨调用第三方服务了雨晨调用第三方服务了雨晨调用第三方服务了";
        StringEntity stringEntity = new StringEntity(body);

        httpPost.setEntity(stringEntity);

        CloseableHttpResponse response = httpClient.execute(httpPost);

        String s = EntityUtils.toString(response.getEntity());

        return s;

    }
}
