<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- %@ directive -->
    <!-- URL : http://localhost:8080/testJSP(context명)/exam/hello.jsp-->
<%!	//선언문 
	//전역 - 1번만 실행 
	String name = "홍길동";
	int age = 25;
%>
<%	//스크립트릿
	//지역변수, 호출시 마다 실행(f5 누를때마다 계속 실행)
	age++;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- hello JSP!!<br>  : HTML 주석-->

<%--  안녕하세요 JSP!! <br> : JSP 주석--%> 

나의 이름은 <%=name %>입니다.<br>
<% out.println("나의 이름은 " + name + "입니다."); %> <!-- 선호하는 방법은 아니다 -->

<!-- 내 나이는 <%=age %>살 입니다.<br> -->
<%-- 내 나이는 <%=age %>살 입니다.<br> --%>



</body>
</html>