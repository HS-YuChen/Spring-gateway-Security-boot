package com.yuchen.demo;

import java.util.concurrent.ConcurrentHashMap;

public class Yuchen{

    public static ConcurrentHashMap<String,Object> map = new ConcurrentHashMap<>();

    public static void main(String[] args){
        map.put("yuchen","yuchen");
    }
}
