package com.yuchen;/*
    @author yuchen
    @create -- 
*/

import com.yuchen.bean.ServletInfo;
import com.yuchen.util.ServletUtils;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.ServletContextHandler;

import java.util.List;

public class JettyServer {

    private static final int port = 8088;
    private static Server server = null;
    private static ServletContextHandler servletContextHandler = null;

    public static void main(String[] args) {
        //创建jetty服务 指定端口号
        server = new Server(port);
        servletContextHandler = new ServletContextHandler();
        server.setHandler(servletContextHandler);

        //获取需要注册的servlet集合
        List<ServletInfo> servletList = ServletUtils.getServletList();
        for(ServletInfo sertvlet:servletList){
            //循环添加进ServletContextHandler
            servletContextHandler.addServlet(sertvlet.getServletClass(),sertvlet.getGroup());
        }
        try {
            server.start();
            System.out.println("jetty服务启动完成");
            server.join();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {

                server.stop();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
