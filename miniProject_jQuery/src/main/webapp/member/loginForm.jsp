<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');
body { text-align: center;}
form[name="loginForm"] div {
	color : red;
	font-size : 8pt;
	font-weight : bold;
}
#formWrap {
	display: inline-block;
	text-align: center;
	width: 1100px;
	height: 500px;
}
#formWrap form{
	display: inline-block;
	padding-top: 150px;	
}
#formWrap form table {
	width: 400px;
	height: 200px;
	border-collapse: collapse;
	border: 1px solid #ccc;
}
#formWrap tr, td, th {
	border: 1px solid #ccc;
}
#signin, #signup {
	width: 150px;
	height: 30px;
	background-color: #FFD200;
	border: none;
	border-radius: 5px;
	color: #000;
	font-size: 15px; 
	font-family: 'Black Han Sans', sans-serif;
}
tr td {
	font-family: 'Black Han Sans', sans-serif;
	font-size: 20px;
}
</style>
</head>
<body>
<div id="formWrap">
<form name="loginForm" action="/miniProject_jQuery/member/login.do">
<table>
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="id" id="id">
			<div id="idDiv"></div>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pwd" id="pwd">
			<div id="pwdDiv"></div>
		</td>
		
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input type="button" name="signin" id="signin" value="로그인" onclick="checkLogin()">
			<input type="button" name="signup" id="signup" value="회원가입" 
					onclick="location.href='writeForm.jsp'">	<!-- 전체 주소, 'writeForm.html' 도 가능 -->
		</td>
	</tr>
</table>
</form>
	<c:if test="${ empty sessionScope.memId }">
		<div><jsp:include page="${display }" /></div>
	</c:if>
</div>
<script type="text/javascript" src="../js/login.js"></script>
</body>
</html> --%>




<!-- jQuery : 페이지 이동을 하지 않는다 -->

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
body { text-align: center;}
form[name="loginForm"] div {
	color : red;
	font-size : 8pt;
	font-weight : bold;
}
#formWrap {
	display: inline-block;
	text-align: center;
	width: 1100px;
	height: 500px;
}
#formWrap form{
	display: inline-block;
	padding-top: 150px;	
}
#formWrap form table {
	width: 400px;
	height: 200px;
	border-collapse: collapse;
	border: 1px solid #ccc;
}
#formWrap tr, td, th {
	border: 1px solid #ccc;
}
#loginBtn, #signup {
	width: 150px;
	height: 30px;
	background-color: #FFD200;
	border: none;
	border-radius: 5px;
	color: #000;
	font-size: 15px; 
	font-family: 'Black Han Sans', sans-serif;
}
tr > th {
	font-family: 'Black Han Sans', sans-serif;
	font-size: 20px;
}
</style>
</head>
<body>
<div id="formWrap">
<form name="loginForm" id="loginForm">
<table>
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" name="id" id="id">
			<div id="idDiv"></div>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" name="pwd" id="pwd">
			<div id="pwdDiv"></div>
		</td>
		
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input type="button" name="signin" id="loginBtn" value="로그인">
			<input type="button" name="signup" id="signup" value="회원가입" 
					onclick="location.href='writeForm.jsp'">
		</td>
	</tr>
</table>
<br><br>

<div id="loginResult"></div>
</form>
</div>

<script type="text/javascript" src="../js/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$('#loginBtn').click(function(){
	$('#idDiv').empty(); //document.getElementById("idDiv").innerText = "";
	$('#pwdDiv').empty();
	
	if($('#id').val() == '') {//document.getElementById("id").value == ""
		$('#idDiv').text('아이디 입력');
		$('#id').focus();
	}
	else if($('#pwd').val() == '') {
		$('#pwdDiv').text('비밀번호를 입력하세요');
		$('#pwdDiv').focus();
	}else { //ajax => url수행하고 다시 돌아온다 
		$.ajax({ //코드 작성시 {} 중괄호 안에 작성
			type: 'post', //'get' or 'post'
			
			url: '/miniProject_jQuery/member/login.do', // -> ControlServlet -> LoginService.java
			
			data: 'id='+$('#id').val()+'&pwd='+$('#pwd').val(), //서버로 보낼 데이터 입력: id, pwd / 변수=값&변수=값  
			
			dataType: 'text', //서버로부터 받는 자료형, text, xml, html, json
			
			success: function(data){ //바로 위의 data와는 다르다. 그냥 매개변수 data
				data = data.trim();
				
				if(data == 'ok'){
					location.href = '../index.jsp';
				}else if(data == 'fail'){
					$('#loginResult').text('아이디 또는 비밀번호가 맞지 않습니다.');
					$('#loginResult').css('font-size','12pt');
				}
			},
			error: function(err){
				console.log(err); //주소가 잘못되면 404, get or post 문제 405, 서버쪽 에러 500
			},
		});  	
	}
});

</script>
</body>
</html>


<!-- 
javascript, jquery 둘다 "", '' 상관없이 사용 하지만
javascript는 ""
jquery '' 
를 많이 사용한다. 
 -->




