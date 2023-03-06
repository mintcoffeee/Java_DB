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
<%if(name==null){ 
	//페이지 이동
	response.sendRedirect("loginFail.jsp");
} else {
	//cookie
	/* Cookie cookie = new Cookie("memName", name); //(쿠키명, 값)
	cookie.setMaxAge(30*60); //초 단위 - 30 분 , 쿠키값이 30분동안 살아 있다. 
	response.addCookie(cookie);//클라이언트에 보내기 
	
	Cookie cookie2 = new Cookie("memId", id); //(쿠키명, 값)
	cookie2.setMaxAge(30*60); //초 단위 
	response.addCookie(cookie2);//클라이언트에 보내기 
	 */
	 
	 
	//세션 
	//HttpSession session = request.getSession();	//duplicate : 값이 중복되었다. 
	//JSP 는 세션객체가 이미 내장객체로 존재한다. 
	session.setAttribute("memName", name);
	session.setAttribute("memId", id);
	session.setAttribute("memPwd", pwd);
	
	
	//페이지 이동
	response.sendRedirect("loginOk.jsp");
	
} %>
</body>
</html>