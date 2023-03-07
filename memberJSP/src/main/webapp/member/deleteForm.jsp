<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO" %>
<%
	//data 
	String pwd = request.getParameter("pwd");	//넘어온 데이터 
	System.out.println("pwd = " + pwd); //초기 pwd = null
	
	//session
	String id = (String)session.getAttribute("memId");
	String memPwd = (String)session.getAttribute("memPwd");
	
	//수업시간 풀이 
	boolean exist = false;
	if(pwd != null) {
		//DB
		//MemberDAO memberDAO = MemberDAO.getInstance();	
		//true, false 를 받을 때 method 앞에 보통 is를 붙인다 
		//exist = memberDAO.isExistPwd(id, pwd);	//비밀번호가 있으면 true, 없으면 false
		
		if(memPwd.equals(pwd)) exist=true;	//db isExistPwd 실행 안해도 된다.
	}

	if(exist) response.sendRedirect("delete.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div#pwdDiv {
	color : red;
	font-size : 8pt;
	font-weight : bold;
}
</style>
</head>
<body>
<form name="deleteForm" method="post" action="deleteForm.jsp">	<!-- deleteFrom 재귀, 자신호출, 처음부터 다시 실행 -->
	<div style="text-align: center">
		비밀번호 입력 : 
		<input type="password" name="pwd" id="pwd">
		<input type="button" name="check" id="check" value="검색" onclick="checkDelete()">
		<div id="pwdDiv">
			<%if(pwd != null && !exist){%>
				비밀번호가 맞지 않습니다.
			<%}%>
		</div>
	</div>
</form>
<script type="text/javascript">
function checkDelete(){
	document.getElementById("pwdDiv").innerText = "";
	
	<%-- if(document.getElementById("pwd").value == ""){
		document.getElementById("pwdDiv").innerText = "먼저 비밀번호 입력";
	}
	else if(document.getElementById("pwd").value != <%=pwd %>){
		document.getElementById("pwdDiv").innerText = "비밀번호가 맞지 않습니다.";
	}
	else {
		document.deleteForm.submit();
	} --%>
	
	//수업 db 한번만 사용하기 위해 
	if(document.getElementById("pwd").value == ""){
		document.getElementById("pwdDiv").innerText = "먼저 비밀번호 입력";
	}
	else {
		document.deleteForm.submit();
	}
	
}
</script>
</body>
</html>