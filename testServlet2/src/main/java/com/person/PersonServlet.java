package com.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PersonServlet")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init() {
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String gen = request.getParameter("gender");
		String col = request.getParameter("color");
		String[] hobbies = request.getParameterValues("hobby");
		String[] subjects = request.getParameterValues("subject");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<ul style = 'border:1px solid red; color :" + col +"'>");
		//이름
		out.println("<li>");
		out.println("이름 : " + name);
		out.println("</li>");
		//성별 
		out.println("<li>");
		out.println("성별 : " + (gen.equals("0") ? "남자" : "여자"));
		out.println("</li>");
		//색깔
		out.println("<li>");
		out.println("색깔 : <span style='color:"+col+"'>" 
						+ (col.equals("red") ? "빨강" :  
								col.equals("green") ? "초록" :
									col.equals("blue") ? "파랑" : 
										col.equals("magenta") ? "보라" : "하늘"));
		out.println("</span></li>");	
		//취미 
		out.println("<li>");
		out.println("취미 : ");
		for (String hob : hobbies) {
            out.println(hob + " ");
        }
		out.println("</li>");
		//과목 
		out.println("<li>");
		out.println("과목 : ");
		for (String sub : subjects) {
            out.println(sub + " ");
        }
		out.println("</li>");
		out.println("</ul>");
		out.println("</body>");
		out.println("</html>");
		
	}
	
	public void destroy() {
		
	}

}




