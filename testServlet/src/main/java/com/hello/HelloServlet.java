package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;	//L : long 형 상수 
	
	public void init() {
		System.out.println("init()");
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		
		response.setContentType("text/html;charset=UTF-8");
		
//		1.
//		System.out.println("<html>");	// console 창에 출력
//		2.
//		PrintWriter out = new PrintWriter(new FileWriter("result.txt"));	// result 파일에 출력, 생성 
//		out.println("<html>");
		
//		3.
		PrintWriter out = response.getWriter(); //생성, web으로 출력
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("Hello Servlet!<br>");
		out.println("안녕하세요 서블릿!!");
		out.println("</body>");
		out.println("</html>");
	}
	
	public void destroy() {
		System.out.println("destroy()");
	}

}
//http://localhost:8080/testServlet/com.hello.HelloServlet.class -- x
//http://localhost:8080/testServlet/com.hello.HelloServlet