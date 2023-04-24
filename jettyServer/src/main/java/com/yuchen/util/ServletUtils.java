package com.yuchen.util;/*
    @author yuchen
    @create -- 
*/

import com.yuchen.bean.ServletInfo;
import com.yuchen.servlet.YuchenSerlet;

import java.util.Arrays;
import java.util.List;

public class ServletUtils {
    private static List<ServletInfo> servLetList = Arrays.asList(
            new ServletInfo("/controller/yuchen",YuchenSerlet.class)

    );

    public static List<ServletInfo> getServletList(){
        return servLetList;
    }
}
