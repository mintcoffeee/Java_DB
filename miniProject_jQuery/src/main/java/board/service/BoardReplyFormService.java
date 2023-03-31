package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardReplyFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 1. DATA
		String seq  = request.getParameter("seq"); // 원글 seq
		String pg = request.getParameter("pg");

		// 2. DB
		
		// 3. Response
		request.setAttribute("seq", seq);
		request.setAttribute("pg", pg);
		
		request.setAttribute("display", "/board/boardReplyForm.jsp");
		return "/index.jsp";
	}

}
