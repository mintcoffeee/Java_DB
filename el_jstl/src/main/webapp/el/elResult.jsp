<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//data
	int x = Integer.parseInt(request.getParameter("x"));
	int y = Integer.parseInt(request.getParameter("y"));
	//java 코드
	
	/* MVC
		request.getParamete("x") => param["x"]
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>
${param["x"] } + ${param["y"] } = ${param["x"] + param["y"] }<br><br> 
${param["x"] } - ${param["y"] } = ${param["x"] - param["y"] }<br><br> 
${param.x } * ${param.y } = ${param.x * param.y }<br><br> 
${param.x } / ${param.y } = ${param.x / param.y }<br><br> <!-- 정수 실수 따지지 않는다. 숫자인지 문자인지만 확인 --> 
</h3>
</body>
</html>