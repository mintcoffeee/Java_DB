package com.calc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/CalcServlet")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init() {
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int x = Integer.parseInt(request.getParameter("x"));
		int y = Integer.parseInt(request.getParameter("y"));
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();	// 출력 스트림 생성 
		out.println("<html>");
		out.println("<body style='text-align : center;'>");
		out.println("<h3>");
		out.println(x + " + " + y + " = "+(x+y)+"<br>");
		out.println(x + " - " + y + " = "+(x-y)+"<br>");
		out.println(x + " * " + y + " = "+(x*y)+"<br>");
		out.println(x + " / " + y + " = "+String.format("%.3f",((float)x/y)));
		out.println("</h3>");
		out.println("<input type='button' value='뒤로' onclick='javascript:history.go(-1)'>");	//javascript 생략가능, x,y 입력값 남아있음  
		//history.go(-1) : 한페이지만 뒤로 -2 : 2페이지 뒤로, 즉 제자리
		out.println("<input type='button' value='뒤로' onclick = location.href='http://localhost:8080/testServlet/calc/input.html'>");	//홈페이지를 새롭게 불러옴, x, y값이 안남아있다. 	
		out.println("<input type='button' value='연령제한' onclick = location.href='http://localhost:8080/testServlet/param.html'>");	 	
		out.println("</body>");
		out.println("</html>");
	}

	public void destroy() {
		
	}

}
