package com.asm2.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Jdbc {
    static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    static String dburl = "jdbc:sqlserver://localhost:1433;database=restaurantAsm;encrypt=false";
    static String username = "sa";
    static String password = "123";

    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(dburl, username, password);
    }
    
    //tao ra preparedStatment
    public static PreparedStatement createPreparedStatement(String sql, Object ...values) throws SQLException {
		Connection conn = getConnection();
		PreparedStatement preparedStatement = null;
		if(sql.trim().startsWith("{")) {
			preparedStatement = conn.prepareCall(sql);
		}else {
			preparedStatement = conn.prepareStatement(sql);
		}
		for (int i = 0; i < values.length; i++) {
			preparedStatement.setObject(i+1, values[i]);
		}
		return preparedStatement;
		
	}

   //thao tac du lieu
    public static int executeUpdate(String sql, Object ...values) throws SQLException {
    	PreparedStatement preparedStatement = createPreparedStatement(sql, values);
    	return preparedStatement.executeUpdate();
    	
	}
    
    //truy van du lieu
    public static ResultSet executeQuery(String sql, Object ...values ) throws SQLException {
    	PreparedStatement preparedStatement = createPreparedStatement(sql, values);
    	return preparedStatement.executeQuery();
    	
	}
}
