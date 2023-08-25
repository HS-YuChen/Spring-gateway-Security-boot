package com.yuchen.demo;/*
    @author yuchen
    @create -- 
*/

import com.yuchen.FlinkDemo;
import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import java.io.Serializable;


public class MqttServer implements Serializable {
    private static final long serialVersionUID = 1690798747791808700L;
    private static MqttClient mqttClient;


    private  String broker = "tcp://172.16.32.99:1883";

    private String clientId = "client-yuchen";

    public void connect() throws MqttException {
        mqttClient = new MqttClient(broker,clientId,new MemoryPersistence());
        mqttClient.setCallback(new MqttCallBack());
        mqttClient.connect();
    }

    public void sub(String topic) throws MqttException {
        System.out.println("订阅了topic "+ topic);
        mqttClient.subscribe(topic);
    }

    public void pub(String topic,MqttMessage message) throws MqttException {
        mqttClient.publish(topic,message);
    }

}

class MqttCallBack implements MqttCallback{

    @Override
    public void connectionLost(Throwable throwable) {

    }

    @Override
    public void messageArrived(String s, MqttMessage mqttMessage) throws Exception {
        String mess = String.valueOf(mqttMessage.getPayload());
        System.out.println("来消息了"+mess);
        FlinkDemo.queue.add(mess);
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {

    }
}