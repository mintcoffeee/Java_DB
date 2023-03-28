<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');
html, body {
   width: 100%;
   height: 100%;
}
html {
   overflow-y: scroll;
}

#wrap{
   width: 1100px; 
   margin: 0 auto;
}

#header {
   height: 10%;
   text-align: center;
}

#container {
   margin: auto;
   width: 1100px;
   height: 500px;
}

#container:after {
   content: '';
   display: block;
   clear: both;
   float: none;
}

#nav {
   margin-left: 10px;
   width: 25%;
   height: 100%;
   float: left;
}

#section {
   width: 70%;
   height: 100%;
   float: left;
}

#footer {
   width: 1100px;
   height: 10%;
}
#tabNav {
	display: inline-block;
	text-align: center;
	margin-top:20px;
	margin-left: 25px;
}
#tabNav input{
	width:200px;
	height: 50px;
	background-color: #FFD200;
	border: none;
	border-radius: 5px;
	color: #000;
	font-size: 25px; 
	font-family: 'Black Han Sans', sans-serif;
}
</style>
</head>
<body>
<div id="wrap">
	<div id="header">
		<h1>
		<img src="/miniProject_jQuery/image/3.gif" alt="kakao" width="100"
			 onclick="location.href='/miniProject_jQuery/index.jsp'">MVC를 이용한 미니 프로제트
		</h1>
		<jsp:include page="./main/menu.jsp" />
	</div>
	<div id="container">
		<div id="nav">
			<%-- <c:if test="${ empty sessionScope.memId }"> --%>
				<jsp:include page="./main/nav.jsp" />
			<%-- </c:if>
			<c:if test="${ not empty sessionScope.memId }">
				<jsp:include page="/member/loginOk.jsp" />
			</c:if> --%>
		</div>
		<div id="session">
			<h3>
				<c:if test="${ empty display }">
				<!-- test: 조건, empty = null, 'display 값이 비어있다면 true' -->
					저희 홈페이지를 방문해주셔서 감사합니다.
					Habe a nice day!!
					<img src="/miniProject_jQuery/image/kakao1.png">
				</c:if>
				<c:if test="${ not empty display }"> 
					<jsp:include page="${display }" />
				</c:if>
			</h3>
		</div>
	</div>
	<hr>
	<div id="footer">
		<h4>비트캠프</h4>
	</div>
</div>
</body>
</html>



<!-- 
 include 포함하다
 => nav.jsp 를 만들어 놓고 nav.jsp의 모든 내용을 id="nav"위치에 가져온다 
 
  -->

<!-- 
http://localhost:8080/miniProject_jQuery/index.jsp
http://localhost:8080/miniProject_jQuery

같은 화면 index.jsp 가 보인다. 생략이 가능 하다. 
 -->





