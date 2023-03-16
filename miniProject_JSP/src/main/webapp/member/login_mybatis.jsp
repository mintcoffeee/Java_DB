<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="member.bean.MemberDTO" %>
<%@page import="member.dao.MemberDAO_mybatis"%>
<%
	request.setCharacterEncoding("UTF-8");
	//data
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//db
	MemberDAO_mybatis memberDAO_mybatis = MemberDAO_mybatis.getInstance();	
	
	Map<String, String> map = new HashMap<String, String>();
	map.put("id", id);
	map.put("pwd", pwd);
	MemberDTO memberDTO = memberDAO_mybatis.memberLogin(map);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(memberDTO==null){ 
	//페이지 이동
	response.sendRedirect("loginFail.jsp");
} else {
	String email = memberDTO.getEmail1() + "@" + memberDTO.getEmail2();
	
	//세션 
	session.setAttribute("memId", id);
	session.setAttribute("memPwd", pwd);
	session.setAttribute("memEmail", email);
	
	//페이지 이동
	response.sendRedirect("loginOk.jsp");
	
} %>
</body>
</html>