<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form[name="loginForm"] div {
	color : red;
	font-size : 8pt;
	font-weight : bold;
}
</style>
</head>
<body>
<form name="loginForm" action="/miniProject_jQuery/member/login.do">
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="id" id="id">
			<div id="idDiv"></div>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pwd" id="pwd">
			<div id="pwdDiv"></div>
		</td>
		
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input type="button" name="signin" id="signin" value="로그인" onclick="checkLogin()">
			<input type="button" name="signup" id="signup" value="회원가입" 
					onclick="location.href='writeForm.jsp'">	<!-- 전체 주소, 'writeForm.html' 도 가능 -->
		</td>
	</tr>
</table>
</form>
<script type="text/javascript" src="../js/login.js"></script>
</body>
</html>