<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mia.*" %>
<jsp:useBean id="dao" class="com.mia.DAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 목록</title>
<style>
table, th, tr, td{
	border: 1px solid #444444;
}

#upperTable{
	border: 1px solid blue;
}
</style>
</head>
<body>
<h3><%= session.getAttribute("id")%>님 안녕하세요</h3>
<table id="upperTable">
<% 
	List<ArticleVO> upperList = dao.selectUpperArticles();

	for(int i=0;i<upperList.size();i++){
%>
		<tr style="color:blue;">
			<td>추천 <%= i+1%></td>
			<td><a href="article.jsp?num=<%= upperList.get(i).getNum()%>"><%= upperList.get(i).getTitle()%></a></td>
			<td><%= upperList.get(i).getWriter()%></td>
		</tr>
<% 		
	}
%>
</table>
<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성날짜</th>
		<th>조회수</th>
		<th>추천수</th>
	</tr>	
<% 
	List<ArticleVO> list = dao.selectEntireArticle();

	for(int i=0;i<list.size();i++){
%>
	<tr>
		<td><%= list.get(i).getNum()%></td>
		<td><a href="updateHit.jsp?num=<%= list.get(i).getNum()%>"><%= list.get(i).getTitle()%></a></td>
		<td><%= list.get(i).getWriter()%></td>
		<td><%= list.get(i).getWriteDate()%></td>
		<td><%= list.get(i).getHit()%></td>
		<td><%= list.get(i).getRecommand()%></td>
	<tr>
<% 	
	}
%>
</table>
<br>
<button onclick="location.href='writeForm.jsp'">글쓰기</button>
<button onclick="location.href='logout.jsp'">로그아웃</button>
<% 
	if(session.getAttribute("id").equals("admin")){
%>
		<button onclick="location.href='userList.jsp'">사용자 관리</button>
<% 	
	}
%>
</body>
</html>