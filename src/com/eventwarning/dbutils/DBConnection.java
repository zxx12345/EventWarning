//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.eventwarning.dbutils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;

public class DBConnection {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    private static String driver;
    private static String url;
    private static String user;
    private static String password;

    static {
        Properties properties = new Properties();

        try {
            properties.load(DBConnection.class.getClassLoader().getResourceAsStream("./db.properties"));
            driver = properties.getProperty("driver");
            url = properties.getProperty("url");
            user = properties.getProperty("username");
            password = properties.getProperty("password");
        } catch (IOException var2) {
            var2.printStackTrace();
        }

    }

    public DBConnection() {
    }

    public static Connection getConnection() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException var1) {
            var1.printStackTrace();
        } catch (SQLException var2) {
            var2.printStackTrace();
        }

        return conn;
    }

    public static void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException var2) {
                var2.printStackTrace();
            }
        }

    }

    public static void close(PreparedStatement conn) {
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException var2) {
                var2.printStackTrace();
            }
        }

    }

    public static void close(ResultSet conn) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException var2) {
                var2.printStackTrace();
            }
        }

    }

    public static Result getSelected(String sql) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Result r = null;

        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            System.out.println(sql);
            rs = ps.executeQuery();
            r = ResultSupport.toResult(rs);
        } catch (Exception var9) {
            var9.printStackTrace();
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }

        return r;
    }
}
