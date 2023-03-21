<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jstl.PersonDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%
//자바 역할
List<String> list = new ArrayList<String>();
list.add("호랑이");
list.add("사자");
list.add("기린");
list.add("코끼리");
list.add("타조");
list.add("코알라");
list.add("여우");

PersonDTO aa = new PersonDTO("홍길동", 25);
PersonDTO bb = new PersonDTO("라이언", 23);
PersonDTO cc = new PersonDTO("프로도", 30);

List<PersonDTO> list2 = new ArrayList<PersonDTO>();
list2.add(aa);
list2.add(bb);
list2.add(cc);

//객체는 주소로 넘길 수 없다.
request.setAttribute("list", list);
request.setAttribute("list2", list2);

//페이지 이동
RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp"); //상대번지
dispatcher.forward(request, response); // 제어권 넘기기, forwardResult 랑 request, response 값 공유

%>
<%-- <jsp:forward page="forwardResult.jsp" /> jsp:잘 안사용한다, jsp보다 RequestDispatcher 많이 사용 --%>


