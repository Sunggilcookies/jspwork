package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcTest {
	//jdbc관련 필드 4가지
	static String drivelClass = "oracle.jdbc.OracleDriver"; //드라이버이름
	static String url = "jdbc:oracle:thin:@localhost:1521:xe"; //db 경로(위치)
	static String username = "c##mydb"; //user 이름
	static String password = "mydb";	//비밀번호
	
	public static void main(String[] args) throws ClassNotFoundException {
		//연결 객체 선언
		Connection conn = null;
		
		try {
			Class.forName(drivelClass);
			conn = DriverManager.getConnection(url,username,password);
			System.out.println("연결 객체 생성:" + conn);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
