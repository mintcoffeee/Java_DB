package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardUpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//DATA
		int seq = Integer.parseInt((String)request.getAttribute("seq"));
		int pg = Integer.parseInt((String)request.getAttribute("pg"));
		
		//응답
		request.setAttribute("seq", seq);
		request.setAttribute("pg", pg);
		request.setAttribute("display", "/board/boardUpdateForm.jsp");
		return "/index.jsp";
	}

}
