<%@ page import="member.dao.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//data
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//db
	MemberDAO memberDAO = MemberDAO.getInstance();	
	String name = memberDAO.memberLogin(id, pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(name==null){ %>
	
	<h3>아이디 또는 비밀번호가 맞지 않습니다.</h3>
<%} else { %>
	<input type="text" name="id" id="id" value="<%=id %>" style="display: none;">
	<h3><%=name %> 님이 로그인 하셨습니다.</h3>
	<br>
	<input type="submit" value="회원정보수정" onclick="location.href='updateForm.jsp'">
<%} %>
</body>
</html>