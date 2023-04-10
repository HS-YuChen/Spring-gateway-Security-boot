package com.yuchen.controller;/*
    @author yuchen
    @create -- 
*/

import com.yuchen.bean.DemoBean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/test")
public class DemoController extends HttpServlet {
    private static final long serialVersionUID = -495513345685932591L;

    public static void main(String[] args) {
        sort();
    }
    @RequestMapping("/sort")
    public static String sort(){
        List<DemoBean> list = new ArrayList<>();
        DemoBean K = new DemoBean("K",7);
        DemoBean AK = new DemoBean("JK",7);
        DemoBean AA = new DemoBean("IA",7);
        DemoBean C = new DemoBean("A",7);

        list.add(K);
        list.add(AA);
        list.add(C);
        list.add(AK);

        List<DemoBean> collect = list.stream().sorted(Comparator.comparing(DemoBean::getRight).thenComparing(DemoBean::getLeft)).collect(Collectors.toList());
        for (int i=0;i<collect.size();i++){
            DemoBean demoBean = collect.get(i);
            System.out.println(demoBean.getLeft()+demoBean.getRight());
        }
        return "yuchen";
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enumeration<String> ss = req.getHeaders("ss");
    }
}
