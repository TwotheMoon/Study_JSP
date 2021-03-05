package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Member;
import dto.Product;

public class MemberDao {

		private Connection conn;
		private ResultSet rs;
	
	private static MemberDao instance = new MemberDao();
	
		public static MemberDao getinstance() {
			return instance;
		}
	
	public MemberDao(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root","1234");
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	// 메소드 : 회원 추가
	public int setmember( Member member) {
		
		String SQL = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getBirth());
			pstmt.setString(6, member.getMail());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getAddress());
			pstmt.setString(9, member.getRegist_day());
			pstmt.executeUpdate();
			return 1;	
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return -1;
	}
	
	
	// 로그인 메소드
	public int login(String logId, String logPw) {
		String SQL = "SELECT * FROM member WHERE id = ? and password = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, logId);
			pstmt.setString(2, logPw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
					return 1;
				}else {
					return 0;
				}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	
	// 메소드 : 모든 멤버 호출
		public ArrayList<Member> getAllMembers(){
			ArrayList<Member> listMemebers = new ArrayList<Member>();
			
				String SQL = "SELECT * FROM member";
				try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
					// 쿼리 : 검색 결과의 레코드 [ 테이블 가로 단위]
				while(rs.next()) {	// 쿼리 결과의 레코드가 null 일때 까지 반복
					
					// 한개 레코드의 모든 필드를 각 객체에 대입
					Member member = new Member();
					member.setId(rs.getString(1));
					member.setPassword(rs.getString(2));
					member.setName(rs.getString(3));
					member.setGender(rs.getString(4));
					member.setBirth(rs.getString(5));
					member.setMail(rs.getString(6));
					member.setPhone(rs.getString(7));
					member.setAddress(rs.getString(8));
					member.setRegist_day(rs.getString(9));
					
					listMemebers.add(member);
				}
			}catch (Exception e) {
				
			}
			return listMemebers;
		}
		
		
		// 메소드 : 유저id에 해당하는 유저 정보 반환
			public Member getMember( String id) {
				
				Member member = null;
				
					String SQL = "SELECT * FROM member WHERE id =?";
					
					try {
						PreparedStatement pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						
						if(rs.next()) {	// 쿼리 시작 null 부터
							
							member = new Member();
							member.setId(rs.getString(1));
							member.setPassword(rs.getString(2));
							member.setName(rs.getString(3));
							member.setGender(rs.getString(4));
							member.setBirth(rs.getString(5));
							member.setMail(rs.getString(6));
							member.setPhone(rs.getString(7));
							member.setAddress(rs.getString(8));
							member.setRegist_day(rs.getString(9));
							
							return member;
						}
					}catch (Exception e) {
						e.getStackTrace();
					}
				
				return member;
			}
		
		// 검색 멤버 호출
			public ArrayList<Member> searchGetALLMembers(String key, String keyword) {
				ArrayList<Member> listMembers = new ArrayList<Member>();
				
				String SQL = "SELECT * from member where "+key+" like '%"+keyword+"%'";
				
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Member member = new Member();
						member.setId(rs.getString(1));
						member.setPassword(rs.getString(2));
						member.setName(rs.getString(3));
						member.setGender(rs.getString(4));
						member.setBirth(rs.getString(5));
						member.setMail(rs.getString(6));
						member.setPhone(rs.getString(7));
						member.setAddress(rs.getString(8));
						member.setRegist_day(rs.getString(9));
						
						listMembers.add(member);
					}
				}catch (Exception e) {
					// TODO: handle exception
				}
				return listMembers;
			}
		
		// 메소드 : 멤버 수정
			public int updateMember( Member member) {
				
				String SQL = "update member set id=? , password=? , name=? , "
						+ "gender=? , birth=? , mail=? , phone =?, "
						+ "address=? , regist_day=? where id =?";
				
				try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPassword());
				pstmt.setString(3, member.getName());
				pstmt.setString(4, member.getGender());
				pstmt.setString(5, member.getBirth());
				pstmt.setString(6, member.getMail());
				pstmt.setString(7, member.getPhone());
				pstmt.setString(9, member.getAddress());
				pstmt.setString(9, member.getRegist_day());
					pstmt.executeUpdate();
				return 1;	
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				
				return -1;
			}
			
		
			// 메소드 : 멤버 삭제
					public int deleteMember( String id) {
						
						String SQL = "delete from member where id =?";
						
						try {
						PreparedStatement pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1, id);	
						pstmt.executeUpdate();
						return 1;	
						}
						catch (Exception e) {
							e.printStackTrace();
						}
						
						return -1;
					}
					

}
