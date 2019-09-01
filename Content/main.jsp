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
</style>
</head>
<body>
<h3>~님 안녕하세요</h3>
<table >
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
		<td><%= list.get(i).getTitle()%></td>
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
<button>글쓰기</button>
<button>로그아웃</button>
</body>
</html>