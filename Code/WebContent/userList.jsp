<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mia.UsersVO" %>
<jsp:useBean id="dao" class="com.mia.DAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 사용자관리(관리자용)</title>
<style>
table tr td{
	border : 1px solid;
}
</style>
</head>
<body>
<table>
	<tr>
		<td>아이디</td>
		<td>이름</td>
	</tr>
<% 
	List<UsersVO> users = dao.selectAllUsers();

	for(int i=0;i<users.size();i++){
%>
		<tr>
			<td><%= users.get(i).getId() %></td>
			<td><%= users.get(i).getName() %></td>
		</tr>
<%
	}
%>
</table>
<button onclick="location.href='main.jsp'">메인페이지로</button>
</body>
</html>