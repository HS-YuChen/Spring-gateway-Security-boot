package com.yuchen.demo;/*
    @author yuchen
    @create -- 
*/

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class IODemo {

    public static void main(String[] args) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
//        date.setTime(1697101969484l);
        System.out.println(format.format(date));
        System.out.println(System.currentTimeMillis());
    }


}
