<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="dao" class="com.mia.DAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 회원가입(구현)</title>
</head>
<body>
<% 
	String id = request.getParameter("ids");
	String password = request.getParameter("passwd");
	String name = request.getParameter("names");
	
	int result = dao.registerUser(id, password, name);
	
	if(result != 0){
	
		out.println("<script>");
		out.println("alert('등록이 완료되었습니다.');");
		out.println("location.href='home.jsp'");
		out.println("</script>");
	}
	else{
	
		out.println("<script>");
		out.println("alert('등록이 제대로 완료하지 않았습니다.');");
		out.println("location.href='home.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>