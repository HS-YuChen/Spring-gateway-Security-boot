package com.yuchen;/*
    @author yuchen
    @create -- 
*/

import rx.internal.util.LinkedArrayList;

import java.io.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;


public class YuchenMain {
    static Lock lock = new ReentrantLock();
    static Condition condition = lock.newCondition();
    public static void main(String[] args) throws IOException {
        lock.lock();
        try {
            System.out.println("yuchen1");
            condition.await();
            System.out.println("yuchen2");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            lock.unlock();
        }
    }
}

class MyThread extends Thread{
    private Service service;

    MyThread(Service service){
        this.service = service;
    }
    @Override
    public void run() {
        service.test();
    }
}

class Service{
    private Lock lock;
    private Condition condition = lock.newCondition();

    public Service(boolean isFair) {
        lock = new ReentrantLock(isFair);
    }

    public void test(){
        lock.lock();
        try {
            System.out.println("A");
            condition.await();
            System.out.println("B");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            lock.unlock();
        }
    }
}