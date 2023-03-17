<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="angel" uri="tld" %> <!-- /WEB-INF/elFunc.tld = tld -->
<!-- taglib angel이라는 새로운 태그의 정보를 알려준다  -->
<!-- url 웹 경로, uri : 파일 위치, uri> url uri 가 더 큰 개념 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>자바클래스의 메소드를 이용</h3>
${param["x"] } + ${param["y"] } = ${ angel:sum(param["x"] , param["y"]) }<br><br> 
${param.x } * ${param.y } = ${ angel:mul(param.x , param.y) }<br><br> 
</body>
</html>