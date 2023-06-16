package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import common.JDBCUtil;

public class MemberDAO {
	//필드
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//회원가입
	public void addMember(Member member) {
		conn = JDBCUtil.getConnection();
		String sql = "INSERT INTO t_member(memberid, passwd, name, gender)"
				+"VALUES(?,?,?,?)";
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn,pstmt);
		}
	}
	
	
	//회원 목록
	public ArrayList<Member> getMemberList(){
		ArrayList<Member> memberList = new ArrayList<>();
		conn = JDBCUtil.getConnection();
		String sql = "SELECT * FROM t_member ORDER BY joindate DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				Member member = new Member();
				member.setMemberId(rs.getString("memberid")); //db에서 꺼내옴
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setJoinDate(rs.getDate("joinDate"));
				
				memberList.add(member); // 리스트에 저장
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return memberList;
	}
	
	//회원 상세보기(정보)
	public Member getMember(String memberId) {
		Member member = new Member();
		conn = JDBCUtil.getConnection();
		String sql = "SELECT * FROM t_member WHERE memberid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setMemberId(rs.getString("memberid"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setJoinDate(rs.getDate("joindate"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return member;
	}
	
	//로그인 체크
	public boolean checkLogin(Member member) {	
		conn = JDBCUtil.getConnection();
		String sql = "SELECT * FROM t_member "
				+ "WHERE memberid = ? and passwd = ?" ;
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getMemberId());
		pstmt.setString(2, member.getPasswd());
		rs = pstmt.executeQuery();
		
			if(rs.next()) {
				return true;
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return false;
		
	}
	//회원 삭제
	public void deletMember(String memberId) {
		conn =JDBCUtil.getConnection();
		String sql = "DELETE FROM t_member WHERE memberId=?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, memberId);
					
					pstmt.executeUpdate(); //db에 저장
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					JDBCUtil.close(conn, pstmt);
				}
				
				
	}
	// 오류sg 1. rs값에 pstmt가져온값 저장 2. 데이터한줄 띠면 2번째줄 공백한칸 띄어주기 
	//ID 중복 체크
	public boolean duplicatedID(String memberId) {
		
		boolean result = false;
		conn =JDBCUtil.getConnection();
		String sql = "SELECT DECODE (COUNT(*), 1, 'true', 'false') AS result"
				+ " FROM t_member WHERE memberid = ?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, memberId);					
					rs=pstmt.executeQuery(); //db에 저장
					
					if (rs.next()){
						result = rs.getBoolean("result"); //칼럼이 result인 값을 꺼내옴
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					JDBCUtil.close(conn, pstmt ,rs);
				}
				
				
	
		
		return result;
	};
	
}
		
		

