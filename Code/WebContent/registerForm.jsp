<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MVC 게시판 - 회원가입</title>
</head>
<body>
<form action="register.jsp" method="post" onsubmit="return checkForm()">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" id="ids" name="ids" /></td>	
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" id="passwd" name="passwd" /></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" id="names" name="names" /></td>
	</tr>
</table>
<br>
<button>회원가입</button>
<button type="button" onclick="location.href='home.jsp'">취소</button> 
<!-- <button onclick="location.href='home.jsp'">test</button> // 위와 차이는 type 유무인데 type이 있는 건 제대로 실행, 없는건 action으로 등록해둔 페이지로 이동 -->
</form>
<!-- <button onclick="location.href='home.jsp'">취소</button> form에 넣지 않는다면 type 설정을 하지 않고도 제대로 실행된다. -->
<script>
function checkForm(){
	
	var id = document.forms[0].ids.value;
	var password = document.forms[0].passwd.value;
	var name = document.forms[0].names.value;
	
	if(id == null || id == ""){
		alert("아이디를 입력하세요.");
		return false;
	}
	
	if(password == null || password == ""){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	if(name == null || name == ""){
		alert("이름을 입력하세요.");
		return false;
	}
	
	return true;
}
</script>
</body>
</html>