<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mia.ArticleVO" %>
<jsp:useBean id="dao" class="com.mia.DAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 게시판 글</title>
<style>
table tr td{

	border : 1px solid;
}
</style>
</head>
<body>
<% 
	String num = request.getParameter("num");
	ArticleVO article = dao.selectOneArticle(Integer.parseInt(num));
	
%>
<table>
	<tr>
		<td>번호</td>
		<td><%= article.getNum()%></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><%= article.getTitle()%></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%= article.getWriter()%></td>
	</tr>
	<tr>
		<td>작성날짜</td>
		<td><%= article.getWriteDate()%></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td><%= article.getHit()%></td>
	</tr>
	<tr>
		<td>추천수</td>
		<td><%= article.getRecommand()%></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><%= article.getContent()%></td>
	</tr>
</table>
<button onclick="location.href='modifyForm.jsp?num=<%= num%>'">수정</button>

<% 
	if(!session.getAttribute("id").equals("admin")){
%>
		<button onclick="location.href='updateRecommand.jsp?num=<%= num%>'">추천</button>
<%		
	}

	if(session.getAttribute("id").equals(article.getWriter()) || session.getAttribute("id").equals("admin")){
%>
		<button onclick="location.href='delete.jsp?num=<%= num%>'">삭제</button>
<% 
	}
%>

<button onclick="location.href='main.jsp'">뒤로</button>
</body>
</html>