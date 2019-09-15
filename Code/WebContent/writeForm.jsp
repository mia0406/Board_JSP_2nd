<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 글쓰기</title>
</head>
<body>
<form action="write.jsp" method="post"><br/>
제목 : <input type="text" id="title" name="title" /><br/>
작성자 : <input type="text" id="writer" name="writer" /><br/>
내용 : <input type="text" id="content" name="content" /><br/>
<input type="submit" value="작성" />
</form>

<% 
	//System.out.println(session.getAttribute("id"));
	if((session.getAttribute("id")).equals(null)){
		out.println("<script>");
		out.println(""); // alert 창으로 로그인 먼저 해주세요 나온 다음에, home.jsp로 이동
		out.println("</script>");
	}
	
	if((session.getAttribute("id")).equals("admin")){
		out.println("<button onclick=\"location.href='mainAdmin.jsp'\">취소</button>");
	}
	else{
		out.println("<button onclick=\"location.href='main.jsp'\">취소</button>");	
	}
%>
</body>
</html>