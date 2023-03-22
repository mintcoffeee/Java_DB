<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.subjectA:link {color:black; text-decoration: none;} /* 한 번도 클릭하지 않았을 경우 */
.subjectA:visited {color:black; text-decoration: none;} /* 마우스 클릭 후 */
td .subjectA:hover {color:pink; text-decoration: underline;} /* 마우스를 올렸을 때, td 는 부모 */
.subjectA:active {color:black; text-decoration: none;} /* 마우스를 누르고 있을 때 */

#currentPaging{
	color: red;
	border: 1px solid red;
	padding: 5px 8px; /* (top, bottom) , (left, right) */
	margin: 5px; /* top, right, bottom, left */
	cursor: pointer;
}
#paging {
	color: black;
	padding: 5px;
	margin: 5px;
	cursor: pointer;
}
</style>
</head>
<body>
<img src="../image/3.gif" width="70" height="70" alt="잘자콩"
	onclick="location.href='../index.jsp'" style="cursor: pointer;">
<table border="1" cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
	<tr>
		<th width="100">글번호</th>
		<th width="400">제목</th>
		<th width="150">작성자</th>
		<th width="100">조회수</th>
		<th width="150">작성일</th>
	</tr>
	<c:forEach var="boardDTO" items="${list }">
		
		<tr>
			<td align="center">${boardDTO.getSeq() }</td>
			<td><a class="subjectA" href="#" onclick="isLogin('${boardDTO.getId() }',${boardDTO.getSeq() },${pg })">${boardDTO.getSubject()}</a></td>
			<td align="center">${boardDTO.getId() }</td>
			<td align="center">${boardDTO.getHit() }</td>	<!-- 조회수 -->
			<td align="center">
				<fmt:formatDate value="${boardDTO.getLogtime()}" pattern="yyyy.MM.dd" />
			</td>
		</tr>
	</c:forEach>
</table>

<div style="margin-top: 15px; width: 850px; text-align: center;">
	${boardPaging.getPagingHTML() }
</div>

<script type="text/javascript">
function boardPaging(pg) {
	location.href="boardList.do?pg=" + pg;	
}
function isLogin(memId, seq, pg){
	if(memId == 'null'){
		alert("먼저 로그인 하세요")
		location.href="../member/loginForm.jsp"
	}else {
		location.href="boardView.jsp?seq="+ seq +"&pg=" + pg;
	} 
}
</script>
</body>
</html>