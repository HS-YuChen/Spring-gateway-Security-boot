package com.yuchen.bean;/*
    @author yuchen
    @create -- 
*/

import lombok.Data;
@Data
public class MqttBean {
    private String message;
    private String ts;
    private Double amount;
}
