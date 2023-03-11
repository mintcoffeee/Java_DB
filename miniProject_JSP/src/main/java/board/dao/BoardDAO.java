package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	private static BoardDAO boardDAO = new BoardDAO();	//static 메모리에 한번만 생성 
	public static BoardDAO getInstance() {
		return boardDAO;
	}
	
	public BoardDAO() {
		try {
			Context ctx = new InitialContext(); //생성
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle"); //context.xml에서 maxActive 를 받아온다, Tomcat인 경우에는 java:comp/env/ 추가로 붙여야 한다. 
		} catch (NamingException e) {
			e.printStackTrace();
		}	
		
	}
	
	private static void close(Connection conn , PreparedStatement pstmt) {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//Overloading
	private static void close(Connection conn , PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void boardWrite(BoardDTO boardDTO) {
		String sql = "insert into board(seq, id, name, email, subject, content, ref)"
				+ " values(seq_board.nextval, ?, ?, ?, ?, ?, seq_board.nextval)";
		//생성한 TABLE에서 NOT NULL COLUMN인 대상들은 VALUE 필수
		
		try {
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			//?에 대입
			pstmt.setString(1, boardDTO.getId());
			pstmt.setString(2, boardDTO.getName());
			pstmt.setString(3, boardDTO.getEmail());
			pstmt.setString(4, boardDTO.getSubject());
			pstmt.setString(5, boardDTO.getContent());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BoardDAO.close(conn, pstmt);
		}
		
	}
	
	public void boardWriteT(Map<String, String> map) {
		String sql = "insert into board(seq, id, name, email, subject, content, ref)"
				+ " values(seq_board.nextval, ?, ?, ?, ?, ?, seq_board.nextval)";
		// SQL 구문 작성 시, TABLE에 COL을 지정하지 않으면 모든 COL의 VALUE를 입력해줘야하는 문제 발생
		// 입력이 필요한 COL만 INSERT 후 나머지는 DB TABLE에 설정해놓은 DEFAULT값 이용
		// SQL 구문 개행 시, 띄어쓰기가 되지 않아서 구문이 실행되지 않는 경유 유의
		// SEQ_BOARD.NEXTVAL이 두 번 사용되지만 동시에 실행되므로 같은 값이 RETURN 됨
		// 또는 REF에 SEQ_BOARD.CURRVAL 사용 가능
		
		try {
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			//?에 대입
			pstmt.setString(1, map.get("id"));
			pstmt.setString(2, map.get("name"));
			pstmt.setString(3, map.get("email"));
			pstmt.setString(4, map.get("subject"));
			pstmt.setString(5, map.get("content"));
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BoardDAO.close(conn, pstmt);
		}
	}
	
	public List<BoardDTO> boardList(Map<String, Integer> map){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		String sql = "select * from "
					+ "(select rownum RN, TT.* from"
					+ "(select * from board order by ref desc, step asc) TT"
					+ ")where RN>=? and RN<=?";
		
		try {
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, map.get("startNum"));
			pstmt.setInt(2, map.get("endNum"));
			
			rs = pstmt.executeQuery();	//실행 - ResultSet 리턴
			
			while(rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getDate("logtime"));
				
				list.add(boardDTO);
			}//while
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
			// List가 try 구문 전에 이미 생성되었기 때문에
			// try 부분에서 error 발생 시, local variable의 garbage value가 list에 담겨 return 될 수 있음
			// 그러므로 try 구문에서 error 발생 시, catch에서 list=null을 만들어서 null값을 return 시킴
		} finally {
			BoardDAO.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	
	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from board";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totalA = rs.getInt(1);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BoardDAO.close(conn, pstmt, rs);
		}
		
		return totalA;
	}
	
	public BoardDTO getBoard(int seq) {
		BoardDTO boardDTO = null; //javascript 에서는 null 대신 ""사용 
		String sql = "select * from board where seq=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardDTO = new BoardDTO();
				
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getDate("logtime"));
				
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BoardDAO.close(conn, pstmt, rs);
		}
		
		return boardDTO;
	}
}
