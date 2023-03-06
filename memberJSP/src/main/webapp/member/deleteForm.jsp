<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pwd = (String)session.getAttribute("memPwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	color : red;
	font-size : 8pt;
	font-weight : bold;
}
</style>
</head>
<body>
<form name="deleteForm" method="post" action="delete.jsp">
비밀번호 입력 : 
<input type="password" name="pwd" id="pwd">
<input type="button" name="check" id="check" value="확인" onclick="pwdCheck()">
<div id="pwdDiv"></div>
</form>
<script type="text/javascript">
function pwdCheck(){
	document.getElementById("pwdDiv").innerText = "";
	
	if(document.getElementById("pwd").value == ""){
		document.getElementById("pwdDiv").innerText = "비밀번호 입력";
	}
	else if(document.getElementById("pwd").value != <%=pwd %>){
		document.getElementById("pwdDiv").innerText = "비밀번호가 맞지 않습니다.";
	}
	else {
		document.deleteForm.submit();
	}
		
}
</script>
</body>
</html>