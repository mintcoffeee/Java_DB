package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateMain {
	private Connection conn;
	private PreparedStatement pstmt;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "1234"; 
	
	public UpdateMain() {
		try {
			//driver loading 
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void updateArticle() {
		Scanner scan = new Scanner(System.in);
		System.out.print("검색할 이름 입력 : ");
		String name = scan.next();
		String sql = "UPDATE DBTEST SET AGE=AGE+1,HEIGHT=HEIGHT+1 WHERE NAME LIKE ?";
		this.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			int su = pstmt.executeUpdate();
			System.out.println(su + " 행 이(가) 업데이트 되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public static void main(String[] args) {
		UpdateMain um = new UpdateMain();
		um.updateArticle();
	}

}


/*
검 할 이름 입력 : 홍

이름에 홍이 들어간 레코드를 나이를 1증가, 키도 1증가 하시오 
*/
