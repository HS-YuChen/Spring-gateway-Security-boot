package com.yuchen.demo;

public class Yuchen{

    public static void main(String[] args) {
        Thread thread1 = new Thread(new Demo());
        Thread thread2 = new Thread(new Demo());
        thread1.start();
        thread2.start();
    }
}

class Demo extends Thread{
    @Override
    public void run() {
//        test1();
//        test2();
        test3();
    }

    public void test1(){
        synchronized(this){
            for (int i = 0; i < 100; i++) {
                System.out.println(Thread.currentThread().getName()+":"+i);
            }
        }
    }

    public synchronized void test2(){
        for (int i = 0; i < 100; i++) {
            System.out.println(Thread.currentThread().getName()+":"+i);
        }
    }

    public synchronized static void test3(){
        for (int i = 0; i < 100; i++) {
            System.out.println(Thread.currentThread().getName()+":"+i);
        }
    }

    public static void test4(){
        synchronized(Demo.class){
            for (int i = 0; i < 100; i++) {
                System.out.println(Thread.currentThread().getName()+":"+i);
            }
        }
    }
}