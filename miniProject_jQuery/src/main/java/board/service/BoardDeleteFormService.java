package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardDeleteFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//DATA
		String seq = request.getParameter("seq");
				
		//응답
		request.setAttribute("seq", seq);
		request.setAttribute("display", "/board/boardDeleteForm.jsp");
		return "/index.jsp";
	}

}

//request.setAttribute("display", "/board/boardList.do?pg=1");
//ControlServlet -> BoardListService.java 
//프로그램이 엉킬 수 있다. 
