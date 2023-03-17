<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>*** 변수 설정 ***</h3>
<c:set var="name" value="홍길동" />
<c:set var="age">25</c:set>

나의 이름은 <c:out value="${name }" /> 입니다.<br> <!-- <c:out value="${name }" ></c:out> -->
내 나이는 ${age }살 입니다. <br> <!-- 변수 설정 하지 않고 찍어도 에러가 발생하지 않는다. -->

<h3>*** forEach ***</h3>

<c:forEach var="i" begin="1" end="10" step="1"> <%-- for(int i=1; i<=10; i++) --%>
	${i }&nbsp;&emsp;	<!-- &nbsp: 1칸, &emsp: 4칸 -->
	<c:set var="sum" value="${sum + i }" />
</c:forEach>
<br>
1 ~ 10 까지의 합  = ${sum }
<br><br>

<c:forEach var="i" begin="1" end="10" step="1"> 
	${11-i }&nbsp;&emsp;	
</c:forEach>

<h3>*** forToken ***</h3>
<c:forTokens var="car" items="소나타,아우디,링컨,페라리,벤츠" delims=",">
	${car }<br> 
</c:forTokens>
</body>
</html>