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
        server = new Server(port);
        servletContextHandler = new ServletContextHandler();
        server.setHandler(servletContextHandler);

        List<ServletInfo> servletList = ServletUtils.getServletList();
        for(ServletInfo sertvlet:servletList){
            servletContextHandler.addServlet(sertvlet.getServletClass(),sertvlet.getGroup());
        }
        try {
            server.start();
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
