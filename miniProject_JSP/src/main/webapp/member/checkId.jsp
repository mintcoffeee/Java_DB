<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO" %>
<%
	//Data
	String id = request.getParameter("id");
	
	//DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	boolean existId = memberDAO.isExistId(id);	//아이디가 있다(ture) = 사용 불가능 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(existId) {%>
	<form action="checkId.jsp">
		<h3><%=id %>는 사용 불가능</h3>
		아이디 <input type="text" name="id"><input type="submit" value="중복체크">
	</form>
<%} else { %>
	<h3><%=id %>는 사용 가능</h3>
	<input type="button" value="사용하기" onclick="checkIdClose('<%=id %>')">
<%} %>

<script type="text/javascript">
function checkIdClose(id) {
	opener.writeForm.id.value = id;	
	opener.writeForm.idCheck.value = id;	
	//opener.writeForm.check.value = 1;	//중복체크 버튼을 눌렀다는 확인
	
	//opener.writeForm.check.value = id; //수업 풀이
	
	//opner 열려있는 창 중에 writeForm의 id 속성 value 값을 찾는다 
	//writeForm.id.value에서 id 는 name속성을 의미한다 
	
	window.close();
	opener.writeForm.pwd.focus();
}
</script>
</body>
</html>