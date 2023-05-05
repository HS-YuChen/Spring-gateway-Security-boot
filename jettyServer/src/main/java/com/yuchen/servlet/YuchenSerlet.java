package com.yuchen.servlet;/*
    @author yuchen
    @create -- 
*/

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

public class YuchenSerlet extends HttpServlet {
    private static final long serialVersionUID = 1930070168719207625L;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("经过get请求了");
        BufferedReader reader = req.getReader();
        StringBuilder sb = new StringBuilder();
        String data = "";
        if((data = reader.readLine())!=null){
            sb.append(data);
        }
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Content-Type","application/json");
        resp.getWriter().write(sb.toString());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String[]> parameterMap = req.getParameterMap();
        String name = getParam("name", parameterMap);
        String height = getParam("height", parameterMap);
        String weight = getParam("weight", parameterMap);

        System.out.println("经过post请求了");
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = req.getReader();
        String data = "";
        if((data = reader.readLine())!=null){
            sb.append(data);
        }
        String param = name+height+weight;
        System.out.println(param);
        System.out.println(sb.toString());
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Content-Type","application/json");
        resp.getWriter().write(sb.toString()+param);

    }


    public String getParam(String str,Map<String,String[]> parameterMap){
        String result = "";
        if(parameterMap.containsKey(str)){
            result = parameterMap.get(str)[0];
        }
        return result;
    }
}
