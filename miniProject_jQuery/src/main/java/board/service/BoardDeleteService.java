package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//DATA
		String seq = request.getParameter("seq");
		
		//DB
		BoardDAO baordDAO = BoardDAO.getInstance();
		baordDAO.boardDelete(seq);
		//응답
		return "/board/boardDelete.jsp";
	}

}
