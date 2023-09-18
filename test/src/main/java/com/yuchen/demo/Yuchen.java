package com.yuchen.demo;

import java.util.Timer;
import java.util.TimerTask;

public class Yuchen{

    public static void main(String[] args) {
        Timer timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                System.out.println("没5s的任务执行了");
            }
        },10000,5000);
    }
}