package com.mia;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	public DBConnect() {
		
	}
	
	public Connection getConnection() {
	
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String id="mia";
		String password="mia";
		
		Connection conn = null;
		
		try {
			
			Class.forName(driver);
			conn=DriverManager.getConnection(url, id, password);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
