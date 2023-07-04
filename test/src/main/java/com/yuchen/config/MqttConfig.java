package com.yuchen.config;/*
    @author yuchen
    @create -- 
*/

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@Data
@AllArgsConstructor
@NoArgsConstructor
@Slf4j
public class MqttConfig {

    @Value("mqtt.broker")
    private String broker;

    @Value("mqtt.clientId")
    private String clientId;

    @Value("mqtt.password")
    private String password;

    @Bean
    public MqTTClient getMqttClient(){
        log.info("MqttClient 现在开始初始化了");
        MqttConfig mqttConfig = new MqttConfig(broker,clientId,password);
        MqTTClient mqTTClient = MqTTClient.initClient(mqttConfig);
        return mqTTClient;
    }
}
