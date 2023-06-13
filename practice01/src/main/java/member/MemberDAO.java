package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.taglibs.standard.lang.jstl.ValueSuffix;

public class MemberDAO {

	//필드
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//회원가입
	public void addMemeber(Member member) {
		conn = JDBCUtil.getConnection();
		String sql = "INSERT INTO sg_member(memberid, passwd, name, gender)"
				+ "VALUES(?,?,?,?)";
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.execute();
			
			
		}catch	(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn,pstmt);
		}
		
	}
	
	//회원 목록
	public ArrayList<Member> getMembersList(){
		ArrayList<Memeber> memberList = new ArrayList<>();
		conn = JDBCUtill.getConnection();
		String sqlString = "SELECT * FROM sg_member ORDER BY joindate DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Member member =new Member();
				member.setMemberId(rs));
				
			}
		}
		
	}
	
}