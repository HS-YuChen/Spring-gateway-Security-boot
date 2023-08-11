package com.yuchen.controller;/*
    @author yuchen
    @create -- 
*/

import com.yuchen.config.MqTTClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/emqx")
public class MqTTController {
    @Autowired
    private MqTTClient client;

    @PostMapping("/pushMessage")
    public void pushMessage(String topic,String message){
        client.pushMessage(topic,message);
    }

    @PostMapping("/subscribe")
    public void subscribe(String topic) throws MqttException {
        client.subscribe(topic);
    }
}
