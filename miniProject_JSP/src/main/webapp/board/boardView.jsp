<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.dao.BoardDAO" %>
<%
	String seq =;
	String subject = (String)session.getAttribute("boardSubjcet");

	BoardDAO boardDAO = BoardDAO.getInstance();
	String content = boardDAO.boardView(seq);
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
<h3>
<img src="../image/3.gif" alt="잘자콩" id="home" width="50" height="50" style="cursor: pointer;" 
	onclick="location.href='../index.jsp'">글쓰기  
</h3>
<form name="boardWriteForm" method="post" action="boardWrite.jsp">
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="subject" id="subject" size="50" 
				placeholder="제목 입력" value=""><%=seq %>
			<div id="subDiv" ></div>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="content" id="content" cols="50" rows="15"></textarea>
			<div id="contentDiv" ></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center">
		<input type="button" name="" value="목록" onclick="history.go(-1)">
		<input type="reset" name="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
</body>
</html>