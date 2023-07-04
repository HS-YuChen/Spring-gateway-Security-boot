package com.yuchen.config;/*
    @author yuchen
    @create -- 
*/

import lombok.extern.slf4j.Slf4j;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
@Slf4j
public class MqTTClient {

    private static MqttConfig mqttConfig;
    private static MqttClient client;

    private static MqTTClient mqTTClient = new MqTTClient();

    public static MqTTClient initClient(MqttConfig config){
        mqttConfig = config;
        mqTTClient.connectionMqTT();
        log.info("emqx 初始化完成");
        return mqTTClient;
    }

    private void connectionMqTT() {
        try {
            client= new MqttClient(mqttConfig.getBroker(), mqttConfig.getClientId(), new MemoryPersistence());
            MqttConnectOptions options = new MqttConnectOptions();
            options.setUserName(mqttConfig.getClientId());
            options.setUserName(mqttConfig.getPassword());
            client.connect(options);
        } catch (MqttException e) {

        }
    }

    public void pushMessage(String topic,String message){
        MqttMessage mqttMessage = new MqttMessage(message.getBytes());
        mqttMessage.setQos(0);
        try {
            client.publish(topic,mqttMessage);
        } catch (MqttException e) {

        }
    }
}
