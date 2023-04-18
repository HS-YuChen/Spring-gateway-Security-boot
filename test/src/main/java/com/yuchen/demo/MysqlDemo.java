package com.yuchen.demo;/*
    @author yuchen
    @create -- 
*/

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlDemo {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        jdbc();
    }


    static void jdbc() throws ClassNotFoundException, SQLException {
//        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://172.16.32.90:3306/uvp?Unicode=true&characterEncoding=UTF-8&allowMultiQueries=true&serverTimezone=GMT%2b8","root","Root123!");

    }
}
