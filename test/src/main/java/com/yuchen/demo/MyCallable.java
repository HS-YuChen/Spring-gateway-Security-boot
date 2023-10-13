package com.yuchen.demo;/*
    @author yuchen
    @create -'- 
*/

import java.util.concurrent.Callable;

public class MyCallable implements Callable<String> {

    @Override
    public String call() throws Exception {
        Thread.sleep(10000);
        return "开启了Callable线程";
    }
}
