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
			
			pstmt=conn.prepareStatement("SELECT * FROM ARTICLE order by NUM");
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
			pstmt = conn.prepareStatement("INSERT INTO USERS VALUES ('"+ user + "', '" + password + "', '" + name + "')");
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public ArticleVO selectOneArticle(int num) {
		
		ArticleVO article = new ArticleVO();
		Connection conn = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			pstmt=conn.prepareStatement("SELECT * FROM ARTICLE WHERE NUM=?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				article.setNum(rs.getInt("NUM"));
				article.setTitle(rs.getString("TITLE"));
				article.setContent(rs.getString("CONTENT"));
				article.setWriter(rs.getString("WRITER"));
				article.setWriteDate(rs.getDate("WRITEDATE"));
				article.setHit(rs.getInt("HITS"));
				article.setRecommand(rs.getInt("RECOMMAND"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return article;
	}
	
	public int UpdateArticle(String title, String content) {
		
		int result=0;
		Connection conn = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt=conn.prepareStatement("UPDATE ARTICLE SET TITLE=? CONTENT=?");
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;	
	}
	
	public int WriteArticle(String title, String writer, String content) {
		
		int result=0;
		Connection conn = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt=conn.prepareStatement("INSERT INTO ARTICLE VALUES ((SELECT MAX(NUM)+1 FROM ARTICLE), '"+ title +"', '"+ writer +"', '"+ content +"', sysdate, 0, 0)");
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public int DeleteArticle(int num) {
		
		int result=0;
		Connection conn = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt=conn.prepareStatement("DELETE FROM ARTICLE WHERE num=?");
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public int UpdateHit(int num) {
		
		int result=0;
		Connection conn = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt=conn.prepareStatement("SELECT HITS FROM ARTICLE WHERE num=?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			int hits=0;
			
			while(rs.next()) {
				hits=rs.getInt("HITS");
			}
			
			pstmt=conn.prepareStatement("UPDATE ARTICLE SET hits=? WHERE num=?");
			pstmt.setInt(1, hits+1);
			pstmt.setInt(2, num);
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public int UpdateRecommand(int num) {
		
		int result=0;
		Connection conn = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt=conn.prepareStatement("SELECT RECOMMAND FROM ARTICLE WHERE num=?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			int recommand=0;
			
			while(rs.next()) {
				recommand=rs.getInt("RECOMMAND");
			}
					
			//System.out.println("recommand = " + recommand);
			
			pstmt=conn.prepareStatement("UPDATE ARTICLE SET recommand=? WHERE num=?");
			
			pstmt.setInt(1, recommand+1);
			pstmt.setInt(2, num);
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public int DeleteRecommand(int num) {
		
		int result=0;
		Connection conn = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			/*
			pstmt=conn.prepareStatement("UPDATE ARTICLE SET recommand=? WHERE num=?");
			pstmt.setInt(1, );
			pstmt.setInt(2, num);
			result=pstmt.executeUpdate();
			*/
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
}
