<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.mia.DAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 추천(구현)</title>
</head>
<body>
<h3>updateRecommand.jsp</h3>
<% 
	String num = request.getParameter("num");	

	dao.UpdateRecommand(Integer.parseInt(num));
%>
</body>
</html>