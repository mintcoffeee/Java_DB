package board.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class GetBoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//DATA
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//DB: 1페이지당 5개의 글을 가져온다 
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<BoardDTO> list  = boardDAO.boardList(map);
		
		//List 객체를 json으로 변환시켜서 보내야한다. 
		JSONObject json = new JSONObject(); // 그림판 > 중괄호 역활
		
		if(list != null) {
			JSONArray array = new JSONArray(); // 대괄호 
			
			for(BoardDTO boardDTO : list) {
				JSONObject temp = new JSONObject();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				
				temp.put("seq", boardDTO.getSeq());
				temp.put("id", boardDTO.getId());
				temp.put("name", boardDTO.getName());
				temp.put("email", boardDTO.getEmail());
				temp.put("subject", boardDTO.getSubject());
				temp.put("content", boardDTO.getContent());
				temp.put("ref", boardDTO.getRef());
				temp.put("lev", boardDTO.getLev());
				temp.put("step", boardDTO.getStep());
				temp.put("pseq", boardDTO.getPseq());
				temp.put("reply", boardDTO.getReply());
				temp.put("hit", boardDTO.getHit());
				temp.put("logtime", sdf.format(boardDTO.getLogtime())); //Date -> String으로 변환
				
				array.add(temp);
			} //for
			
			json.put("list", array);
		}//if
		
		
		//응답
		request.setAttribute("json", json);
		return "/board/getBoardList.jsp";
	}

}
