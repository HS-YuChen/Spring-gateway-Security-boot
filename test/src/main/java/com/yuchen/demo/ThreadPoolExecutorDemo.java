package com.yuchen.demo;/*
    @author yuchen
    @create -- 
*/

import java.util.HashMap;
import java.util.concurrent.*;

public class ThreadPoolExecutorDemo {
    private static ExecutorService executorService;


    public static void main(String[] args) {
        Service service = new Service();
        MyThread t1 = new MyThread(service);
        MyThread t2 = new MyThread(service);

        new Thread(t1).start();
        new Thread(t2).start();
    }

    static void cacheThreadPool(){
        executorService = Executors.newCachedThreadPool();
        Executors.newFixedThreadPool(100);
        Executors.newCachedThreadPool(new ThreadFactory() {
            @Override
            public Thread newThread(Runnable r) {
                return null;
            }
        });
        executorService.execute(()-> System.out.println("yuchen"));
    }
}

class Service{
    HashMap<String,String> map = new HashMap<>();
    void test(){
        for(int i = 0;i<50000;i++){
            map.put(Thread.currentThread().getName()+" "+(i+1),"yuchen");
            System.out.println(Thread.currentThread().getName()+" "+(i+1));
        }
    }
}

class MyThread implements Runnable{
    Service service;
    MyThread(Service service){
        this.service = service;

    }
    @Override
    public void run() {
        service.test();
    }
}