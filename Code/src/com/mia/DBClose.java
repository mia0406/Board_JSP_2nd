package com.mia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBClose {
	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
	
		try {
			
			if(rs!=null) {
				rs.close();
				rs=null;
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		try {
			
			if(pstmt!=null) {
				pstmt.close();
				pstmt=null;
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		try {
			
			if(conn!=null) {
				conn.close();
				conn=null;
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
