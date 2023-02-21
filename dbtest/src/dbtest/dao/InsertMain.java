package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertMain {
	private Connection conn;
	private PreparedStatement pstmt;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "1234";
	
	
	public InsertMain() {
		//driver loading
		//OracleDriver.class 클래스? 인터페이스? 알지 못한다 -> Class(몽타주) 
		//ex) 남?, 여? => 사람, 몽타주
		
		try {
			Class.forName(driver);
			//Class 타입으로 생성 ("풀 쿼리 네임" 으로 설정, "홍길동")
			System.out.println("driver loading 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}	
		//생성자 안에서 접속하면 안된다. 접속이 한번밖에 안된다. 카톡을 한번밖에 못연다.
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
			//rmi : 원격, jdbc:oracle :oracle접근 
			System.out.println("connection 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void insertArticle() {
		Scanner scan = new Scanner(System.in);
		System.out.print("이름 입력 : ");
		String name = scan.next();
		System.out.print("나이 입력 : ");
		int age = scan.nextInt();
		System.out.print("키 입력 : ");
		double height = scan.nextDouble();
		//---------------
		
		
		this.getConnection(); //접속 
		String sql = "INSERT INTO DBTEST VALUES(?, ?, ?, sysdate)";
		try {
			// sql 명령어를 처리할 수 있는 가이드 생성
			pstmt  = conn.prepareStatement(sql);	//생성 
			
			//?에 데이터 대입
			pstmt.setString(1,name);
			pstmt.setInt(2,age);
			pstmt.setDouble(3,height);
			
			int su = pstmt.executeUpdate();	//실행 - 개수 리턴 
			System.out.println(su + " 행 이(가) 삽입되었습니다.");	//실행 안될시 su = 0
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}

	public static void main(String[] args) {
		InsertMain im = new InsertMain();
		im.insertArticle();
		//java는 자동 커밋한다.
	}
}
