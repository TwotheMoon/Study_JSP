package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class BbsDAO {

		private Connection conn;
	
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
			
			String SQL = "select now()"; // DB 함수 = now : 현재날짜/시간 //DATE : 날짜 // TIME : 시간
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
		String SQL = "select MAX(bbsID) from bbsboard";	// MAX 최대값 함수
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
				
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
	public int write( String bbsTitle , String bbsContents, String bbsuserID , String File) {
		String SQL = "insert into bbsboard values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getnext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsContents);
			pstmt.setString(4, bbsuserID);
			pstmt.setString(5, getdate());
			pstmt.setInt(6, 1);	// 게시물 여부 // 사용 = 1 // 불가 = 0
			pstmt.setString(7, File);
			pstmt.executeUpdate();
			return 1;
		}
		catch (Exception e) {
		}
	return -1; 	
	}
	
	
	// 게시물 목록보기 => 모든 게시물 검색 => Arraylist
	public ArrayList<Bbs> getlist( int pagenumber) {
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		
		String SQL = "select * from bbsboard where and bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getnext() - (pagenumber -1) * 10);
			
			rs = pstmt.executeQuery();
		
			while(rs.next()) {	// 모든 쿼리 실행
				
				Bbs bbs = new Bbs();	// 게시물 객체
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsContents(rs.getString(3));
				bbs.setBbsuserID(rs.getString(4));
				bbs.setBbsData(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
			
				list.add(bbs);	// list => 주소값 주소값 ...
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	
	
	// 다음 페이지 여부 확인 메소드
	public boolean nextpage(int pagenumber) {
		
		String SQL = "SELECT * from bbsboard where bbsID < ? AND bbsAvailable =1";
		
		try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, getnext() - (pagenumber-1) * 10);
						// 마지막번호 - (현재페이지 - 1) * 나올 페이지수
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			
			return true; // 다음 페이지 있으면 // 쿼리 결과에 숫자 있으면
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;	// 페이지 없으면	// 쿼리 결과에 음수 나오면
	}
	
	// 게시물 번호에 해당하는 데이터 출력
	public Bbs getbbs(int bbsID) {
		
		String SQL = "SELECT * from bbsboard where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsContents(rs.getString(3));
				bbs.setBbsuserID(rs.getString(4));
				bbs.setBbsData(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsFile(rs.getString(7));
				return bbs;		
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null ; // db오류 // 번호에 해당하는 게시물이 존재하지 않을때
		
		
	}
	
	// 게시물 수정
	public int update( String bbsTitle, String bbsContents ,int bbsID) {
		
		String SQL = "UPDATE bbsboard set bbsTitle=? , bbsContents=? where bbsID =?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContents);
			pstmt.setInt(3, bbsID);
			pstmt.executeUpdate();
			return 1;	// 업데이트 성공
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1;	// db오류 업데이트 실패
	}
	
	
	// 게시물 삭제
	public int delete(int bbsID) {
		
		String SQL = "UPDATE bbsboard set bbsAvailable=0 where bbsID=?";
		
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		
		pstmt.setInt(1, bbsID);
		pstmt.executeUpdate();
		
		return 1;
		}
	catch (Exception e) {
		// TODO: handle exception
	}
	 return -1;
	}
	
	
	// 내가쓴글 메소드 
	// 게시물 목록보기 => 모든 게시물 검색 => Arraylist
		public ArrayList<Bbs> getMylist( int pagenumber) {
			ArrayList<Bbs> list = new ArrayList<Bbs>();
			
			String SQL = "select * from bbsboard where userID=? and bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				
				pstmt.setInt(1, getnext() - (pagenumber -1) * 10);
				
				rs = pstmt.executeQuery();
			
				while(rs.next()) {	// 모든 쿼리 실행
					
					Bbs bbs = new Bbs();	// 게시물 객체
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setBbsContents(rs.getString(3));
					bbs.setBbsuserID(rs.getString(4));
					bbs.setBbsData(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
				
					list.add(bbs);	// list => 주소값 주소값 ...
				}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			return list;
		}
}