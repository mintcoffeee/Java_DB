<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/mvcMember/member/check.do">
	<h3>${param.id  } 사용불가</h3>
	아이디 <input type="text" name="id"><input type="submit" value="중복체크">
</form>
</body>
</html>