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
<% 
	String num = request.getParameter("num");	

	int result=dao.UpdateRecommand(Integer.parseInt(num));
	
	if(result!=0){
		
		out.println("<script>");
		out.println("alert('추천 완료하였습니다.')");
		out.println("location.href='article.jsp?num="+ num + "'");
		out.println("</script>");
	}else{
		
		out.println("<script>");
		out.println("alert('추천 기능을 제대로 수행하지 못했습니다.')");
		out.println("location.href='article.jsp?num="+ num + "'");
		out.println("</script>");
	}
%>
</body>
</html>