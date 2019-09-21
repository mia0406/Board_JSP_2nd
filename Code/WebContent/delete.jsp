<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.mia.DAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 글 삭제</title>
</head>
<body>
<% 
	String num=request.getParameter("num");
	int result = dao.DeleteArticle(Integer.parseInt(num));
	
	if(result != 0){
		out.println("<script>");
		out.println("alert('삭제 완료하였습니다.')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('삭제를 제대로 완료하지 못했습니다.')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>