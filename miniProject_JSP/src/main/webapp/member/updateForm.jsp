<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO_mybatis" %>
<%@ page import="member.bean.MemberDTO" %>
<%
	//data
	request.setCharacterEncoding("UTF-8");
	//String id = request.getParameter("id");	//주소을 통해 얻은 id 값 
	String id = (String)session.getAttribute("memId");	//세션으로부터 id 값을 얻어오기 
	
	//DB
	MemberDAO_mybatis memberDAO_mybatis = MemberDAO_mybatis.getInstance();
	MemberDTO memberDTO = memberDAO_mybatis.getMember(id);
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
<body onload="check()"> <!-- onload : body tag 가 읽어졌을 때 처리 , script-->
<form name="updateForm" method="post" action="update.jsp">
<h2>회원가입</h2>
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="name" id="name" style="width : 100px;" value="<%=memberDTO.getName() %>">
			<div id="nameDiv"></div>
		</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>
		<input type="text" name="id" id="id" size="30" value="<%=id %>" readonly>
		<div id="idDiv"></div>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
		<input type="password" name="pwd" id="pwd" size="40">
		<div id="pwdDiv"></div>
		</td>
	</tr>
	<tr>
		<th>재확인</th>
		<td>
		<input type="password" name="repwd" id="repwd" size="40">
		</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
			<input type="radio" name="gender" id="gender_m" value="0" checked>
			<label for="gender_m">남자</label>
			<input type="radio" name="gender" id="gender_f" value="1">
			<label for="gender_f">여자</label>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
		<input type="email" name="email1" style="width:120px" value="<%=memberDTO.getEmail1() %>">
		@
		<input type="email" name="email2" id="email2" style="width:120px" value="<%=memberDTO.getEmail2() %>">
		<select name="email3" id="email3" style="width:120px" onchange="select()">	
			<option value="">직접입력</option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="nate.com">nate.com</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>휴대폰</th>
		<td>
			<select name="tel1" style="width:70px">
				<option>010</option>
				<option>011</option>
				<option>019</option>
				<option>070</option>
			</select>
			- <input type="text" name="tel2">
			- <input type="text" name="tel3">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
			<input type="text" name="zipcode" id="zipcode" size="8" placeholder="우편번호" readonly value="<%=memberDTO.getZipcode() %>">
			<input type="button" value="우편번호검색" onclick="execDaumPostcode()"><br>
			<input type="text" name="addr1" id="addr1" style ="width:400px;" placeholder="주소" readonly value="<%=memberDTO.getAddr1() %>"><br>
			<input type="text" name="addr2" id="addr2" style ="width:400px;" placeholder="상세주소" value="<%=memberDTO.getAddr2() %>">
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="button" name="reset" value="로그아웃" onclick="location.href=logout.jsp">
			<input type="button" name="signup" value="회원정보수정" onclick="checkUpdate()">
		</td>
	</tr>
</table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
function check() {
	document.updateForm.gender[<%=memberDTO.getGender()%>].checked = true;
	document.updateForm.tel1.value = '<%=memberDTO.getTel1() %>';
	/* javascript 에서 ''를 안치면 숫자로 인식, 문자열로 인식하 위해 '' 해야한다.  */
	document.updateForm.tel2.value = '<%=memberDTO.getTel2() %>';
	document.updateForm.tel3.value = '<%=memberDTO.getTel3() %>';
	
}
</script>
</body>
</html>