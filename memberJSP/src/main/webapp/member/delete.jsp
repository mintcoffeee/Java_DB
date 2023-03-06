<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO" %>
    
<%
	String id = (String)session.getAttribute("memId");
	MemberDAO memberDAO = MemberDAO.getInstance();	
	memberDAO.memberDelete(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
삭제완료 
</body>
</html>