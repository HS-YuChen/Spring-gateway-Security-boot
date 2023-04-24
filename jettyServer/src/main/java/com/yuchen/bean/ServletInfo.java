package com.yuchen.bean;/*
    @author yuchen
    @create -- 
*/

import javax.servlet.Servlet;

public class ServletInfo {
    private String group;
    private Class<? extends Servlet> servletClass;

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public Class<? extends Servlet> getServletClass() {
        return servletClass;
    }

    public void setServletClass(Class<? extends Servlet> servletClass) {
        this.servletClass = servletClass;
    }

    public ServletInfo(String group, Class<? extends Servlet> servletClass) {
        this.group = group;
        this.servletClass = servletClass;
    }

    public ServletInfo() {
    }
}
