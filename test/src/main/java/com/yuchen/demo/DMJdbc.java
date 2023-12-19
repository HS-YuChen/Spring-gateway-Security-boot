package com.yuchen.demo;/*
    @author yuchen
    @create -- 
*/

import java.sql.*;

public class DMJdbc {
    public static void main(String[] args) {
        // 定义DM JDBC驱动串
        String jdbcString = "dm.jdbc.driver.DmDriver";
        // 定义DM URL连接串
        String urlString = "jdbc:dm://localhost:5236";
        // 定义连接用户名
        String userName = "SYSDBA";
        // 定义连接用户口令
        String password = "SYSDBA123!";
        // 定义连接对象
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName(jdbcString);
            conn = DriverManager.getConnection(urlString, userName, password);
            String sql = "SELECT * FROM INIT_NEW.T_CONFIG";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
                if (i > 1) {
                    System.out.print(",");
                }
                System.out.print(metaData.getColumnLabel(i));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
