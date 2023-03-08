<%@ page import="member.bean.MemberDTO" %>
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
	
	//getMmeber
	MemberDTO memberDTO = memberDAO.getMember(id);
	String email = memberDTO.getEmail1() + "@" + memberDTO.getEmail2();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(name==null){ 
	//페이지 이동
	response.sendRedirect("loginFail.jsp");
} else {
	//세션 
	session.setAttribute("memName", name);
	session.setAttribute("memId", id);
	session.setAttribute("memPwd", pwd);
	session.setAttribute("memEmail", email);
	
	
	//페이지 이동
	response.sendRedirect("loginOk.jsp");
	
} %>
</body>
</html>