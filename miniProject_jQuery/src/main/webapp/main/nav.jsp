<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="tabNav">
	<c:if test="${sessionScope.memId == null }">
		<input type="button" value="로그인" 
			onclick="location.href='/miniProject_jQuery/member/loginForm.do'"><br><br>
		<input type="button" value="회원가입"
			onclick="location.href='/miniProject_jQuery/member/writeForm.do'"><br><br>
	</c:if>
	
	<c:if test="${memId != null }">
		<h3>${memId }님 로그인</h3> 
		<input type="button" value="로그아웃" id="logoutBtn">
	</c:if>
</div>

<!-- CDN 방식 : 직접 다운받지 않고 인터넷에서 가져오는것 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$('#logoutBtn').click(function(){
	$.ajax({ // jquery.ajax 서버 요청 
		type: 'post',
		url: '/miniProject_jQuery/member/logout.do',
		success: function(){
			alert('로그아웃');
			//location.href = '/miniProject_jQuery/index.jsp';   
			location.href = './index.jsp';
		},
		error: function(err){
			console.log(err);
		}
		
		
	});
});
</script>



<!-- 
pageScope : 현재 페이지에서 찾는것 
requestScope
sessionScope
 -->

 
 