<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.mia.DAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 글쓰기(구현)</title>
</head>
<body>
<% 
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	int result = dao.WriteArticle(title, writer, content);
	
	out.println("<script>");
	if(result != 0){
			
		out.println("alert('글 등록이 완료되었습니다.')");	
	}
	else{
		
		out.println("alert('글 등록이 제대로 완료하지 않았습니다.')");
	}
	
	if((session.getAttribute("id")).equals("admin")){
		out.println("location.href='mainAdmin.jsp'");
	}
	else{
		out.println("location.href='main.jsp'");	
	}
	out.println("</script>");
%>
</body>
</html>