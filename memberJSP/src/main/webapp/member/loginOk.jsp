<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터
	String name = null;
	String id = null;
	
	//cookie
	/* Cookie[] ar = request.getCookies();//특정 쿠키를 얻을수가 없으므로 모든 쿠키를 다 가져온다. 
	if(ar != null){ // ar = null 인경우는 3초가 지나서 cookie가 다 없어진 경우이다.
		for(int i=0;i<ar.length;i++){
			String cookieName = ar[i].getName(); 
			String cookieValue = ar[i].getValue(); 
			
			System.out.println("쿠키명 = " + cookieName);
			System.out.println("쿠키값 = " + cookieValue);
			System.out.println();
			
			if(cookieName.equals("memName")) name = cookieValue;
			if(cookieName.equals("memId")) id = cookieValue;
		}//for 
	}//if */
	
	name = (String)session.getAttribute("memName");
	id = (String)session.getAttribute("memId");
	
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <input type="submit" value="회원정보수정" onclick="location.href='updateForm.jsp?id=<%=id%>'"> --%>
																<!-- 공백 사용하면 안된다. -->
<h3><%=name %> 님이 로그인 하셨습니다.</h3><br>
<input type="submit" value="로그아웃" onclick="location.href='logout.jsp'">
<input type="submit" value="회원정보수정" onclick="location.href='updateForm.jsp'">
<input type="submit" value="회원탈퇴" onclick="location.href='deleteForm.jsp'">
</body>
</html>