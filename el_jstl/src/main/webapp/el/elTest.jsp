<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="50%">
	<tr>
		<th width="50%">표현식</th>
		<th>값</th>
	</tr>
	
	<tr>
		<td align="center">\${25+3}</td>
		<td align="center">${25+3 }</td> <!-- ${25+3} 자바 코드가 아니다. %= %>: 자바코드-->
	</tr>
	<tr>
		<td align="center">\${25/3 }</td>
		<td align="center">${25/3 }</td>
	</tr>
	<tr>
		<td align="center">\${25 div 3 }</td>
		<td align="center">${25 div 3 }</td>
	</tr>
	<tr>
		<td align="center">\${25%3 }</td>
		<td align="center">${25%3 }</td>
	</tr>
	<tr>
		<td align="center">\${25 mod 3 }</td>
		<td align="center">${25 mod 3 }</td> <!-- mod : 나머지 -->
	</tr>
	<tr>
		<td align="center">\${25 < 3 }</td>
		<td align="center">${25 < 3 }</td>
	</tr>
	
	<!--  > gt, < lt, >= ge, <= le, == eq, != ne -->
	<tr>
		<td align="center">\${25 ne 3 }</td>
		<td align="center">${25 ne 3 }</td>
	</tr>
	<tr>
		<td align="center">\${header['host'] }</td>
		<td align="center">${header['host'] }</td>
	</tr>
	<tr>
		<td align="center">\${header.host }</td>
		<td align="center">${header.host }</td>
	</tr>
</table>
</body>
</html>


