<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}
th {
	width: 50px;
	height: 30px;
}
</style>
</head>
<body>
<form name="form" action="elResult2.jsp">
<h3>자바클래스의 메소드를 이용</h3>
<table border="1">
	<tr>
		<th>X</th>
		<td><input type="text" name="x"></td>
	</tr>
	<tr>
		<th>Y</th>
		<td><input type="text" name="y"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" name="submit" value="SUBMIT">
			<input type="reset" name="reset" value="RESET">
		</td>
	</tr>
</table>
</form>
</body>
</html>