<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 로그아웃</title>
</head>
<body>
<%
    session.invalidate(); // 기존 세션 데이터 모두 삭제, 세션 초기화
    response.sendRedirect("home.jsp"); // 로그인 페이지로 이동
%>
</body>
</html>
