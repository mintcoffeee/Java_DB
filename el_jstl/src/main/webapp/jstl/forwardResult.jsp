<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
결과 = ${requestScope.list } <br><br>
세번째 항목 = ${requestScope.list[2] }<br><br>

결과 = ${requestScope.list2 }<br><br>

<%-- for(PersonDTO personDTO : list) {} // PersonDTO와 같은 자료형 존재--%>

<!--  메소드의 이름을 변수명처럼 사용할 수 있다. -->
<c:forEach var="personDTO" items="${list2 }">
<!-- 자료형이 없다, requestScope. 을 쓰지 않아도 자동으로 requset에서 탐색 -->
	이름 = ${personDTO.getName() } &emsp; 나이 = ${personDTO.getAge() };<br>
	이름 = ${personDTO.name } &emsp; 나이 = ${personDTO.age };<br><br>
	<!-- name=getName(), age=getAge() -->
	<!-- PersonDTO의 name이 아니다. private는 클래스 내에서만 사용 가능 -->
	
</c:forEach>
</body>
</html>