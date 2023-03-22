<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/mvcMember/member/checkId.do">
	<h3>${param.id  } 사용불가</h3> 
	<!-- 수업풀이 
		 request.setAttribute("id", id); 으로 id 값 전달 했을 때
		 ${requestScope.id }로 받는다. 
	-->
	아이디 <input type="text" name="id"><input type="submit" value="중복체크">
</form>
</body>
</html>