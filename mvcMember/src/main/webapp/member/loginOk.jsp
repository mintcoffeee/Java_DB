<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
String name = session.getAttribute("memName");
 --%>
<h3>${sessionScope.memName } 님이 로그인 하셨습니다.</h3><br>
	
<input type="submit" value="로그아웃" onclick="location.href='/mvcMember/member/logout.do'">

<input type="submit" value="회원정보수정" onclick="location.href='updateForm.jsp'">
<input type="submit" value="회원탈퇴" onclick="location.href='deleteForm.jsp'">
</body>
</html>