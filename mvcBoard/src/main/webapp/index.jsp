<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:link { color: red; text-decoration: none;}	/* 처음나올때  */
a:visited { color: black; }	/* 한번 들어갔다가 나온 애들  */
a:hover { color: pink; text-decoration: underline;}
a:active { color: cyan; text-decoration: none;}
</style>
</head>
<body>
<div>
<h2>*** 메인화면 ***</h2>
<h3>
	<%if(session.getAttribute("memId") == null ){ %>
		<a href="/mvcBoard/member/writeForm.do">회원가입</a><br>
		<a href="/mvcBoard/member/loginForm.do">로그인</a><br>
	<%} else {%>
		<a href="/mvcBoard/member/logout.do">로그아웃</a><br>
		<a href="/mvcBoard/member/updateForm.do">회원정보수정</a><br>
		<a href="/mvcBoard/member/deleteForm.do">회원탈퇴</a><br>
		<a href="/mvcBoard/board/boardWriteForm.do">글쓰기</a><br>
	<%} %>
	
	<a href="/mvcBoard/board/boardList.do?pg=1">목록</a><br>
</h3>
</div>
</body>
</html>