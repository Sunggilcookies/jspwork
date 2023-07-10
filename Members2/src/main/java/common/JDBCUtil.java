package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtil {
	static String drivelClass = "oracle.jdbc.OracleDriver"; //드라이버이름
	static String url = "jdbc:oracle:thin:@localhost:1521:xe"; //db 경로(위치)
	static String username = "c##mydb"; //user 이름
	static String password = "mydb";	//비밀번호
	//DB 연결 메서드
	public static Connection getConnection() {
		try {
			Class.forName(drivelClass);
			return DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	//DB 연결 종류 메서드
	public static void close(Connection conn, PreparedStatement pstmt) {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				pstmt = null;
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				conn = null;
			}
		}
	}
	//DB 연결 종류 메서드(ResultSet이 있는 경우)
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(rs != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				rs = null;
			}
		}
		
		
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				pstmt = null;
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				conn = null;
			}
		}
		
	}
	}
	
	

