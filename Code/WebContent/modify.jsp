<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<jsp:useBean id="dao" class="com.mia.DAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 글 수정(구현)</title>
</head>
<body>
<% 
	String num=request.getParameter("num");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	int result=dao.UpdateArticle(Integer.parseInt(num), title, content);
	
	if(result!=0){
		
		out.println("<script>");
		out.println("alert('수정 완료하였습니다.')");
		out.println("location.href='article.jsp?num="+ num +"'");
		out.println("</script>");
	}else{
		
		out.println("<script>");
		out.println("alert('글을 수정하는데 오류가 발생하였습니다.')");
		out.println("location.href='article.jsp?num="+ num +"'");
		out.println("</script>");
	}
%>
</body>
</html>