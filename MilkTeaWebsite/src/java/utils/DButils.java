/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Lenovo
 */
public class DButils {
    
    private static final String DB_NAME = "PRJ302-MilkTeaShop";
    private static final String DB_USER_NAME = "sa";
    private static final String DB_PASSWORD = "12345";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_NAME;
        conn = DriverManager.getConnection(url, DB_USER_NAME, DB_PASSWORD);
        return conn;
    }
    
    
//    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        DButils x = new DButils();
//        System.out.println(x.getConnection());
//    }
    
    //Ham su dung cho KetNoi Dong :getConnection_Dynamic
    public static Connection getConnection_Dynamicction() throws SQLException, ClassNotFoundException, NamingException {
        Connection conn = null;
        Context context = new InitialContext();
        //Context end = (Context) context.lookup("java.com/env");
        Context end = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) end.lookup("DBDynamicConnection"); //data.sql not .activation
        conn = ds.getConnection();
        return conn;
    }
}
