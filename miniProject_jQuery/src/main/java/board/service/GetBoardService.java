package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class GetBoardService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//DATA
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardDTO boardDTO = boardDAO.getBoard(seq);
		
		//BoardDTO -> JSON 변환 
		JSONObject json = new JSONObject();

		json.put("seq", boardDTO.getSeq());
		json.put("id", boardDTO.getId());
		json.put("name", boardDTO.getName());
		json.put("email", boardDTO.getEmail());
		json.put("subject", boardDTO.getSubject());
		json.put("content", boardDTO.getContent());
		json.put("hit", boardDTO.getHit());
		
		//세션 
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		
		//응답
		request.setAttribute("json", json);
		request.setAttribute("memId", memId);
		return "/board/getBoard.jsp";
	}

}
