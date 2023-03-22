<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${param.id } 사용 가능</h3> 
<!-- 수업 풀이
	 ${id} requestScope 안써도 된다. 자기가 알아서 requestScope로 올라간다.
 -->
<input type="button" value="사용하기" onclick="checkIdClose('${param.id }')">
<!-- ${requestScope.id} -->

<script type="text/javascript">
function checkIdClose(id) {
	opener.writeForm.id.value = id;	
	opener.writeForm.check.value = id; 
	window.close();
	opener.writeForm.pwd.focus();
}
</script>
</body>
</html>