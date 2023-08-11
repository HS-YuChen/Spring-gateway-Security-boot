package com.yuchen;/*
    @author yuchen
    @create -- 
*/

import org.springframework.beans.factory.annotation.Value;
import java.io.*;
import java.text.ParseException;



public class YuchenMain {

    @Value("${server.version}")
    private static String version;

    public static void main(String[] args){
        System.out.println(version);
    }
}
