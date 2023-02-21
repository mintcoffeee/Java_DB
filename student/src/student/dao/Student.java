package student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Student {
	Scanner scan = new Scanner(System.in);
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "1234";
	
	
	public Student() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}	
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void insertArticle() {
		while(true) {
			System.out.println();
			System.out.println("***********************");
			System.out.println("\t1.학생");
			System.out.println("\t2.교수");
			System.out.println("\t3.관리자");
			System.out.println("\t4.이전메뉴");
			System.out.println("***********************");
			System.out.print("\t번호선택 : ");
			int num = scan.nextInt();
			if(num == 4) break;
			
			System.out.print("이름 입력 : ");
			String name = scan.next();
			if(num == 1) {
				System.out.print("학번 입력 : ");
			}else if (num == 2) {
				System.out.print("과목 입력 : ");
			}else if (num == 3) {
				System.out.print("부서 입력 : ");
			}			
			String value = scan.next();
			
			// DB insert 
			getConnection();
			String sql = "insert into student2 values(?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(sql);
				//?에 데이터 대입 
				pstmt.setString(1, name);
				pstmt.setString(2, value);
				pstmt.setInt(3, num);
				
				int su = pstmt.executeUpdate();	//실행 
				System.out.println(su + " 행 이(가) 삽입되었습니다.");
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
		}//while 
	}
	
	public void selectArticle() {
		while(true) {
			System.out.println("***********************");
			System.out.println("\t1.이름검색(1개 글자가 포함된 이름은 모두 검색");
			System.out.println("\t2.전체 검색");
			System.out.println("\t3.이전메뉴");
			System.out.println("***********************");
			System.out.print("\t번호선택 : ");
			int num = scan.nextInt();
			if(num == 3) break;
			
			//데이터
			String sql = null;
			String name = null;
			if(num == 1) {
				System.out.print("검색할 이름 입력 : ");
				name = scan.next();
				
				sql = "select * from student2 where name like ?";
			} else if (num == 2) {
				sql = "select * from student2";
			};
			
			//DB select
			getConnection();
			try {
				pstmt = conn.prepareStatement(sql);
				if(num == 1) pstmt.setString(1, "%"+name+"%");
				//출력
				rs = pstmt.executeQuery();	//실행 - ResultSet 리턴 
				while(rs.next()) {
					System.out.print("이름 = " + rs.getString("name") + "\t");
					if(rs.getInt("code") == 1)
						System.out.print("학번 = " + rs.getString("value") + "\t");
					else if(rs.getInt("code") == 2)
						System.out.print("과목 = " + rs.getString("value") + "\t");
					else if(rs.getInt("code") == 3)
						System.out.print("부서 = " + rs.getString("value") + "\t");
					System.out.println();
				}//while 
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}//while
		
	}
	
	public void deleteArticle() {
		System.out.println("삭제를 원하는 이름 입력 : (정확하게 3글자가 모두 입력된 상태)");
		String name = scan.next();
		
		//-----
		getConnection();
		String sql = "delete student2 where name = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			//? data
			pstmt.setString(1, name);
			int su = pstmt.executeUpdate();
			System.out.println(su + "개 행 이(가) 삭제되었습니다.");
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
	public void menu() {
		while(true) {
			
		System.out.println("***********************");
		System.out.println("\t관리");
		System.out.println("***********************");
		System.out.println("\t1.입력");
		System.out.println("\t2.검색");
		System.out.println("\t3.삭제");
		System.out.println("\t4.종료");
		System.out.println("***********************");
		System.out.print("\t번호선택 : ");
		int num = scan.nextInt();
		
		if(num == 4) break;
		
		if(num == 1) insertArticle();
		else if(num == 2) selectArticle();
		else if(num == 3) deleteArticle();
		}
	}
	
	
	public static void main(String[] args) {
		Student s = new Student();
		s.menu();
		System.out.println("프로그램을 종료합니다.");
	}
}
