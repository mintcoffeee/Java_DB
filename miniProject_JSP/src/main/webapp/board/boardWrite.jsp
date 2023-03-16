<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO_mybatis" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%
	request.setCharacterEncoding("UTF-8");
	//data
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	//session
	String id = (String)session.getAttribute("memId");
	String name = (String)session.getAttribute("memName");
	String email = (String)session.getAttribute("memEmail");
	
	
	/*
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
	*/
	
	//Map
	//boardDTO 대신 map에 전달받은 5개의 데이터를 저장 
	Map<String, String> map = new HashMap<>();
	map.put("id", id);	//put("key(이름)", value);
	map.put("name", name);
	map.put("email", email);
	map.put("subject", subject);
	map.put("content", content);
	
	BoardDAO_mybatis boardDAO = BoardDAO_mybatis.getInstance();
	boardDAO.boardWrite(map);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- using map<> -->
<script type="text/javascript">
window.onload=function(){
	alert("글작성 완료");
	location.href="./boardList.jsp?pg=1";
}
</script>
</body>
</html>