package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static BoardDAO boardDAO = new BoardDAO();	//static 메모리에 한번만 생성 
	
	public static BoardDAO getInstance() {
		return boardDAO;
	}
	
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); //문자단위: reader
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void boardWrite(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.boardWrite", map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public List<BoardDTO> boardList(Map<String, Integer> map){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList", map);
		sqlSession.close();
		return list;
	}
	
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}
	
	
	public BoardDTO getBoard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", seq);
		sqlSession.close();
		return boardDTO;
	}
	
	public void boardReply(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		//원글
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", Integer.parseInt(map.get("pseq")));
		
		//step update
		//update board set step=step+1 where ref=원글ref and step>원글step
		sqlSession.update("boardSQL.boardReply1", boardDTO);
		
		//insert
		//답글ref = 원글ref
		//답글lev = 원글lev + 1
		//답글step = 원글step + 1
		
		//Map에는 replyForm으로부터 id, name, emil, subejct, content, pseq를 담아왔다
		//추가로 ref, lev, step 넣었다
		map.put("ref", boardDTO.getRef()+""); // Generics 제약에 따른 String화
		map.put("lev", boardDTO.getLev()+1+"");
		map.put("step", boardDTO.getStep()+1+"");
		sqlSession.insert("boardSQL.boardReply2", map);
		
		//reply update
		//update board set reply=reply+1 where seq=원글번호
		sqlSession.update("boardSQL.boardReply3", boardDTO.getSeq());
		
		sqlSession.commit();
		sqlSession.close();
		
	}
	
	public void boardUpdate(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardUpdate", map);
		sqlSession.commit();
		sqlSession.close();
	}

	public void boardDelete(String seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("boardSQL.boardDelete", Integer.parseInt(seq));
		sqlSession.commit();
		sqlSession.close();
	}

	
}
