package com.yuchen.config;/*
    @author yuchen
    @create -- 
*/

import lombok.extern.slf4j.Slf4j;
import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
@Slf4j
public class MqTTClient {

    private static MqttConfig mqttConfig;
    private static MqttClient client;

    private static MqTTClient mqTTClient = new MqTTClient();

    public static MqTTClient initClient(MqttConfig config){
        mqttConfig = config;
        log.info("打印连接信息:1、服务地址"+mqttConfig.getBroker()+"客户端id" +mqttConfig.getClientId()+"认证密码"+mqttConfig.getPassword());
        try {
            mqTTClient.connectionMqTT();
            log.info("emqx 初始化完成");
        } catch (Exception e) {
            log.error("emqx初始化失败，失败原因如下"+e.getMessage());
        }
        return mqTTClient;
    }

    private void connectionMqTT() throws Exception{
        client= new MqttClient(mqttConfig.getBroker(), mqttConfig.getClientId(), new MemoryPersistence());
        //设置回调函数
        client.setCallback(new MqttCallbackImpl());
        MqttConnectOptions options = new MqttConnectOptions();
        options.setUserName(mqttConfig.getClientId());
        options.setPassword(mqttConfig.getPassword().toCharArray());
        client.connect(options);

    }

    public void pushMessage(String topic,String message){
        MqttMessage mqttMessage = new MqttMessage(message.getBytes());
        mqttMessage.setQos(0);
        try {
            client.publish(topic,mqttMessage);
        } catch (MqttException e) {

        }
    }

    public void subscribe(String topic) throws MqttException {
        client.subscribe(topic,0);
    }

    public void closeConnection() throws MqttException {
        client.disconnect();
        client.close();
    }

    //回调函数类
    public class MqttCallbackImpl implements MqttCallback{

        @Override
        public void connectionLost(Throwable throwable) {
            log.info("connectionLost: " + throwable.getMessage());
        }

        @Override
        public void messageArrived(String topic, MqttMessage message) throws Exception {
            log.info("topic: " + topic);
            log.info("Qos: " + message.getQos());
            log.info("message content: " + new String(message.getPayload()));
        }

        @Override
        public void deliveryComplete(IMqttDeliveryToken token) {
            log.info("deliveryComplete---------" + token.isComplete());
        }
    }

    public boolean isContected(){
        return mqTTClient.isContected();
    }
}
