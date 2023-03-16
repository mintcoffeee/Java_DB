<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.dao.BoardDAO_mybatis" %>
<%@ page import="board.bean.BoardDTO" %>
<%
	//Data
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	//DB
	BoardDAO_mybatis boardDAO = BoardDAO_mybatis.getInstance();
	BoardDTO boardDTO = boardDAO.getBoard(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
pre {
	/* white-space: pre-wrap; */  /* 형식 유지하면서 자동 개행 */
	white-space: pre-line;
	word-break: break-all;
}
</style>
</head>
<body>
<h3>
<img src="../image/3.gif" alt="잘자콩" id="home" width="50" height="50" style="cursor: pointer;" 
	onclick="location.href='../index.jsp'">  
</h3>
<%if(boardDTO != null){ %>
<form name="boardWriteForm" method="post" action="boardWrite.jsp">
<table width="450" border="2" cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
	<tr>
		<td colspan="3">
			<h2><%=boardDTO.getSubject()%></h2>
		</td>
	</tr>
	<tr>
		<td width="150" align="center">글번호 : <%=boardDTO.getSeq() %></td>
		<td width="150" align="center">작성자 : <%=boardDTO.getId() %></td>
		<td width="150" align="center">조회수 : <%=boardDTO.getHit() %></td>
	</tr>
	
	<tr>
		<td colspan="3" height="250" valign="top">
			<div style="width: 100%; height: 100%; overflow: auto;"  >
				<pre id="content"><%=boardDTO.getContent() %></pre>
				<!-- white-space 를 잡으면 반드시 table에 너비가 있어야 한다. 그래야 영어 입력시 자동 개행 가능 -->
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3" style="text-align: left">
		<input type="button" name="" value="목록" onclick="history.go(-1)">
		</td>
	</tr>
</table>
</form>
<%} %>
</body>
</html>