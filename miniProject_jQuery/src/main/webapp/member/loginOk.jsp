<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#logInOk { 
	display: inline-block;
	padding: 20px;
	margin-bottom: 30px;
}
#logInOk img{
	width: 50px;
	height: 50px;
}
#logInOk p{
	display: inline;
	font-size: 20px;
	font-family: 'Black Han Sans', sans-serif;
}
#logInOkbtn {
	margin-left: 15px;
}
#logInOkbtn input{
	width: 100px;
	height: 20px;
	background-color: #FFD200;
	border: none;
	border-radius: 5px;
	color: #000;
	font-size: 15px; 
	font-family: 'Black Han Sans', sans-serif;
}
</style>
</head>
<body>
<div id="logInOk">
	<img src="/miniProject_jQuery/image/apeech.gif" alt="apeech" width="30">
	<p>${sessionScope.memName }님 로그인</p>
</div>
<div id="logInOkbtn">
	<input type="submit" value="로그아웃" onclick="location.href='/miniProject_jQuery/member/logout.do'">
	<input type="submit" value="회원정보수정" onclick="location.href='updateForm.jsp'">
</div>
</body>
</html>