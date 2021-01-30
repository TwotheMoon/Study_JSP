package Bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class BbsDAO {

		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public BbsDAO() {
			
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}
			catch(Exception e) {
		}
	}	
	
	// 게시물 등록날짜 메소드 = 현지시간 [DB시간기준] 메소드
		public String getdate() {
			
			String SQL = "select now()"; // DB 함수 = now : 현재날짜
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					return rs.getString(1); // 성공이면 쿼리 결과 리턴
				}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			return ""; // db 오류이면 공백
		}
		
	// 게시무 번호 메소드
	public int getnext() {	// 게시물의 마지막번호
		String SQL = "select MAX(bbsID) from bbsboard ";
		
		try {
			PreparedStatement pstmtPreparedStatement = conn.prepareStatement(SQL);
				
				rs = pstmt.executeQuery();

				if(rs.next()) {
					return rs.getInt(1) + 1;
					
				}
				// 첫 게시물
				return 1;	// 1로 설정
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1; // db오류
	}
		
		
	// 게시물 등록
	public int write( String bbsTitle , String bbsContents, String userID) {
		String SQL = "insert into bbsboard values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getnext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsContents);
			pstmt.setString(4, userID);
			pstmt.setString(5, getdate());
			pstmt.setInt(6, 1);
			
			pstmt.executeUpdate();
			return 1;
		}
		catch (Exception e) {
			
		}
	return -1; 	
	}
	
}