package guestbook.service;

import java.io.FileWriter;
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
		int seq = Integer.parseInt(request.getParameter("seq"));	//name 속성의 값 
		
		//DB
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		GuestbookDTO guestbookDTO = guestbookDAO.guestbookSearch(seq);
		
		//response
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();	// 웹(브라우저)으로 보내준다. 브라우저는 번해서 화면 결과를 출력 
//		PrintWriter out = new PrintWriter(new FileWriter("result.txt"));
		
		
		if(guestbookDTO != null) {
			out.println("<html>");
			out.println("<body>");
			out.println("<form>");
			out.println("<table border='1' cellpadding='5' cellspacing='0'>");
			out.println("<tr>"
					+ "<th width='150'>작성자</th>"
					+ "<td width='150'>"+guestbookDTO.getName()+"</td>"
					+ "<th width='150'>작성일</th>"
					+ "<td width='150'>"+guestbookDTO.getLogtime()+"</td>"
					+ "</tr>");
			out.println("<tr>"
					+ "<th>이메일</th>"
					+ "<td colspan=3>"+guestbookDTO.getEmail()+"</td>"
					+ "</tr>");
			out.println("<tr>"
					+ "<th>홈페이지</th>"
					+ "<td colspan=3>"+guestbookDTO.getHomepage()+"</td>"
					+ "</tr>");
			out.println("<tr>"
					+ "<th>제목</th>"
					+ "<td colspan=3>"+guestbookDTO.getSubject()+"</td>"
					+ "</tr>");
			out.println("<tr>"
//					+ "<td colspan=4><textarea style='width:500px; height:200px'>"+guestbookDTO.getContent()+"</textarea></td>"
					+ "<td colspan=4 height='200'><pre>"+guestbookDTO.getContent()+"</pre></td>"	//pre : 입력한 그대로 출력 
					+ "</tr>");
			out.println("</table>");
			out.println("</form>");
			out.println("</body>");
			out.println("</html>");
		}else {
			out.println("<h3>글번호가 없습니다.</h3>");
		}
		
	}

}
