package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//DATA
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		//임의 값 
		String id = "lion";
		String name = "라이언2";
		String email = "lion2@gmail.com";
		
		//DB
		//Map
		Map<String, String> map = new HashMap<>();
		map.put("id", id);	//put("key(이름)", value);
		map.put("name", name);
		map.put("email", email);
		map.put("subject", subject);
		map.put("content", content);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardWrite(map);
		
		//응답
		return "/board/boardWrite.jsp";
	}

}
