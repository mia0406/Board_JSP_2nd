package com.mia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO {

	DBConnect dbconnect=null;
	String sql="";
	
	public DAO() {
		dbconnect= new DBConnect();
	}
	
	public int login(String id) {
		
		Connection conn=dbconnect.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement("SELECT * FROM USERS where id=?");
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){  
	 			
				/*
	  			if(password.equals(rs.getString("PASSWORD"))){ 
	  				
	  				if(id.equals("admin")){
	  					session.setAttribute("id",id);
	  				}
	  				else{
		   				session.setAttribute("id",id); 
	  				}
	  			}
	  			else{	
	  			}
	  			*/
			} 			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
}
