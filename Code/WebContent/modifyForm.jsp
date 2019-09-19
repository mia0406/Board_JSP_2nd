<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 글 수정</title>
</head>
<body>
<form action="modify.jsp" method="post"><br/>
<input type="hidden" id="num" name="num" value="<%= request.getParameter("num")%>"/>
제목 : <input type="text" id="title" name="title" /><br/>
작성자 : <input type="text" id="writer" name="writer" value="<%= session.getAttribute("id")%>"/><br/>
내용 : <input type="text" id="content" name="content" /><br/>
<input type="submit" value="수정" />
</form>
</body>
</html>