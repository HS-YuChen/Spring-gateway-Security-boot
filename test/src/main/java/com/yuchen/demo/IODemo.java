package com.yuchen.demo;/*
    @author yuchen
    @create -- 
*/

import java.io.*;

public class IODemo {

    public static void main(String[] args) {
        bufferIO();
    }

    static void bufferIO(){
        InputStream inputStream = null;
        BufferedInputStream bufferedInputStream = null;
        int in = 0;
        Byte[] bytes = new Byte[1024];
        try {
            inputStream = new FileInputStream(new File("E:\\桌面\\临时文件.txt"));
            bufferedInputStream = new BufferedInputStream(inputStream);
            in = bufferedInputStream.read();
            System.out.println(in);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
