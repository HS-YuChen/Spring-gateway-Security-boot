package com.yuchen.demo;/*
    @author yuchen
    @create -- 
*/


import lombok.extern.slf4j.Slf4j;
import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.rowset.serial.SerialStruct;
import java.io.IOException;
import java.nio.charset.Charset;

@RequestMapping("httpClient")
@RestController
@Slf4j
public class HttpClientDemo {

    @Value("${jettyServer}")
    private String jettyServerUrl;
    @GetMapping("/testControllerYuchen")
    public String testControllerYuchen(){
        String result = "";
        try {
//            CloseableHttpResponse closeableHttpResponse = postMethod(jettyServerUrl, "UTF-8", "宋雨晨");
            CloseableHttpResponse closeableHttpResponse = getMethod(jettyServerUrl, "UTF-8", "宋雨晨");
            //获取响应码
            int code = closeableHttpResponse.getCode();
            log.info("响应码为"+code);
            //获取响应体
            result = EntityUtils.toString(closeableHttpResponse.getEntity());
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        return result;
    }

    public CloseableHttpResponse postMethod(String url,String charset,String body) throws IOException {
        //获取CloseableHttpClient对象
        CloseableHttpClient httpClient = HttpClients.createDefault();
        //新建HttpPost对象
        HttpPost httpPost = new HttpPost(url);
        StringEntity stringEntity = new StringEntity(body, Charset.forName(charset));
        httpPost.setEntity(stringEntity);
        //发送请求 得到CloseableHttpResponse对象
        return httpClient.execute(httpPost);
    }

    public CloseableHttpResponse getMethod(String url,String charset,String body) throws IOException {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(url);
        StringEntity stringEntity = new StringEntity(body, Charset.forName(charset));
        httpGet.setEntity(stringEntity);
        return httpClient.execute(httpGet);
    }
}
