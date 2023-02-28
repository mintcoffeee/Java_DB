package guestbook.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;

@WebServlet("/GuestbookSearchServlet")
public class GuestbookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//data
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		//DB
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		GuestbookDTO guestbookDTO = guestbookDAO.guestbookSearch(seq);
		
		//response
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<form>");
		out.println("<table border='1' cellpadding='5' cellspacing='0'>");
		out.println("<tr>"
				+ "<th>작성자</th>"
				+ "<td><input type='text' value='"+guestbookDTO.getName()+"'</td>"
				+ "<th>작성일</th>"
				+ "<td><input type='text' value='"+guestbookDTO.getLogtime()+"'</td>"
				+ "</tr>");
		out.println("<tr>"
				+ "<th>이메일</th>"
				+ "<td colspan=3><input type='text' style='width:300px' value='"+guestbookDTO.getEmail()+"'</td>"
				+ "</tr>");
		out.println("<tr>"
				+ "<th>홈페이지</th>"
				+ "<td colspan=3><input type='text' style='width:300px' value='"+guestbookDTO.getHomepage()+"'</td>"
				+ "</tr>");
		out.println("<tr>"
				+ "<th>제목</th>"
				+ "<td colspan=3><input type='text' style='width:300px' value='"+guestbookDTO.getSubject()+"'</td>"
				+ "</tr>");
		out.println("<tr>"
				+ "<td colspan=4><textarea style='width:500px; height:200px' value='"+guestbookDTO.getContent()+"'</textarea>"
				+ "</tr>");
		out.println("<table>");
		out.println("</table>");
		out.println("</form>");
		out.println("</body>");
		out.println("</html>");
	}

}
