<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션
	//session.removeAttribute("memName");
	//session.removeAttribute("memId");
	
	session.invalidate();	//한번에 세션 모두 제거 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>로그아웃</h3>

<script type="text/javascript">
window.onload =function(){
	alert("로그아웃")
	location.href="../index.jsp";
}
</script>
</body>
</html>