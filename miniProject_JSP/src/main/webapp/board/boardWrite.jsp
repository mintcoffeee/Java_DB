<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
	//data
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	//session
	String id = (String)session.getAttribute("memId");
	String name = (String)session.getAttribute("memName");
	String email = (String)session.getAttribute("memEmail");
	
	//DTO
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setId(id);
	boardDTO.setName(name);
	boardDTO.setEmail(email);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	
	//db
	BoardDAO boardDAO = BoardDAO.getInstance();
	boardDAO.boardWrite(boardDTO);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload=function(){
	alert("글작성 완료");
	location.href="../index.jsp";
}
</script>
</body>
</html>