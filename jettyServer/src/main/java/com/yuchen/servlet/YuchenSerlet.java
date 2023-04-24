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

public class YuchenSerlet extends HttpServlet {
    private static final long serialVersionUID = 1930070168719207625L;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("经过get请求了");
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = req.getReader();
        String data = "";
        if((data = reader.readLine())!=null){
            sb.append(data);
        }
        System.out.println(sb.toString());
        resp.getWriter().write(sb.toString());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("经过post请求了");
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = req.getReader();
        String data = "";
        if((data = reader.readLine())!=null){
            sb.append(data);
        }
        System.out.println(sb.toString());
        resp.getWriter().write(sb.toString());

    }
}
