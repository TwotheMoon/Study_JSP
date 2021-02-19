package bbsData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class BbsDAO {

	private Connection conn;
	private ResultSet rs;

	public BbsDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/moonbbs?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL , dbID , dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	} // BbsDAO END
	
	
	// 게시물 번호(bbsID) 메소드
	public int getBbsNum() {
		String SQL = "SELECT MAX(bbsID) FROM bbs";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}	// 첫 게시물
			
			return 1;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	// 게시물 등록날짜 메소드
	public String getdate() {
		String SQL = "SELECT now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // db 오류이면 공백
	}
	
	// 게시물 등록
	public int write(String bbsTitle , String bbsContents , String bbsuserID , String File ) {
		String SQL = "INSERT INTO bbs VALUES(?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getBbsNum());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsContents);
			pstmt.setString(4, bbsuserID);
			pstmt.setString(5, getdate());
			pstmt.setInt(6, 1); // 게시물 표시여부 // 사용 = 1 // 불가 = 0
			pstmt.setString(7, File);
			pstmt.executeUpdate();
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

	// 게시물 목록보기
	public ArrayList<Bbs> getList(int pagenumber){
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		
		String SQL = "SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getBbsNum() - (pagenumber - 1) * 10);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsContents(rs.getString(3));
				bbs.setBbsuserID(rs.getString(4));
				bbs.setBbsDate(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				
				list.add(bbs);
			}			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	// 다음 페이지 여부 확인 메소드
	public boolean nextpage(int pagenumber) {
		String SQL = "SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable =1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getBbsNum() - (pagenumber-1) * 10);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
