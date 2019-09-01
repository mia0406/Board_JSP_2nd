<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mia.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dao" class="com.mia.DAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 로그인(구현)</title>
</head>
<body>
<%
	String id=request.getParameter("ids");
	String password=request.getParameter("passwd");
	
	UsersVO user = dao.login(id);
	
	if(user.getPassword().equals(password)){
		
		if(id.equals("admin")){		
			session.setAttribute("id",id);
			out.println("<script>");
			out.println("location.href='mainAdmin.jsp'"); 
			out.println("</script>");
		}
		else{			
			session.setAttribute("id",id); 
			out.println("<script>");
			out.println("location.href='main.jsp'"); 
			out.println("</script>");
		}		
	}
	else{
		out.println("<script>");
 		out.println("location.href='home.jsp'"); 
 		out.println("</script>");		
	}		
%>
</body>
</html>