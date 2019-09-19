<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.mia.DAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String num = request.getParameter("num");
	int result=dao.UpdateHit(Integer.parseInt(num));
	
	if(result!=0){
		
		out.println("<script>");
		out.println("location.href='article.jsp?num=" + num + "'");
		out.println("</script>");
		
	}else{
		
		out.println("<script>");
		out.println("alert('글이 제대로 불려오지 않습니다.')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>