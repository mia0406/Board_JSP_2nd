package com.mia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {

	DBConnect dbconnect=null;
	String sql="";
	
	public DAO() {
		dbconnect= new DBConnect();
	}
	
	public UsersVO login(String id) {
		
		Connection conn=dbconnect.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		UsersVO user = null;
		
		try {
			pstmt=conn.prepareStatement("SELECT * FROM USERS where id=?");
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){  
				
				user = new UsersVO();
				user.setId( rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName( rs.getString("name"));
			} 			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return user;
	}
	
	public List<ArticleVO> selectEntireArticle(){
	
		List<ArticleVO> list = new ArrayList<ArticleVO>();
		Connection conn=dbconnect.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			
			pstmt=conn.prepareStatement("SELECT * FROM ARTICLE");
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				ArticleVO article = new ArticleVO();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setWriter(rs.getString("writer"));
				//article.setContent(rs.getString("content"));
				article.setWriteDate(rs.getDate("writedate"));
				article.setHit(rs.getInt("hits"));
				article.setRecommand(rs.getInt("recommand"));
				
				list.add(article);
			}
				
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	public int registerUser(String user, String password, String name) {
		
		int result = 0;
		Connection conn = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("INSERT INTO USERS VALUES ("+ user + ", " + password + ", " + name + ")");
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public ArticleVO selectOneArticle() {
		
		ArticleVO article = new ArticleVO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Connection conn = dbconnect.getConnection();
		
		try {	
			pstmt=conn.prepareStatement("");
			rs=pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return article;
	}
	
	public int WriteArticle() {
		
		int result=0;
		
		return result;
	}
	
	public int UpdateArticle() {
		
		int result=0;
		
		return result;	
	}
	
	public int DeleteArticle() {
		
		int result=0;
		
		return result;
	}
	
	public int UpdateCnt() {
		
		int result=0;
		
		return result;
	}
	
	public int UpdateHit() {
		
		int result=0;
		
		return result;
	}
}
