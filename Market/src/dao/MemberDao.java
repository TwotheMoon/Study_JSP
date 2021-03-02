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
	
	// �޼ҵ� : ȸ�� �߰�
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
	
	
	// �α��� �޼ҵ�
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
	
	
	
	// �޼ҵ� : ��� ��� ȣ��
		public ArrayList<Member> getAllMembers(){
			ArrayList<Member> listMemebers = new ArrayList<Member>();
			
				String SQL = "SELECT * FROM member";
				try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
					// ���� : �˻� ����� ���ڵ� [ ���̺� ���� ����]
				while(rs.next()) {	// ���� ����� ���ڵ尡 null �϶� ���� �ݺ�
					
					// �Ѱ� ���ڵ��� ��� �ʵ带 �� ��ü�� ����
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
		
		
		// �޼ҵ� : ����id�� �ش��ϴ� ���� ���� ��ȯ
			public Member getMember( String id) {
				
				Member member = null;
				
					String SQL = "SELECT * FROM member WHERE id =?";
					
					try {
						PreparedStatement pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						
						if(rs.next()) {	// ���� ���� null ����
							
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
		
		// �˻� ��ǰ ȣ��
			public ArrayList<Member> searchGetALLMembers(String key, String keyword) {
				ArrayList<Member> listMembers = new ArrayList<Member>();
				
				String SQL = "SELECT * member where "+key+" like '%"+keyword+"%'";
				
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
		
		// �޼ҵ� : ��ǰ ����
			public int updateProduct( Product Product) {
				
				String SQL = "update market set pname=? , pprice=? , description=? , "
						+ "manufacturer=? , category=? , pinstock=? , conditions =?, "
						+ "filename=? , activation=? where productID =?";
				
				try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, Product.getPname());
				pstmt.setInt(2, Product.getPprice());
				pstmt.setString(3, Product.getDescription());
				pstmt.setString(4, Product.getManufacturer());
				pstmt.setString(5, Product.getCategory());
				pstmt.setInt(6, Product.getPinstock());
				pstmt.setString(7, Product.getconditions());
				pstmt.setString(8, Product.getFilename());
				pstmt.setInt(9, Product.getActivation());
				pstmt.setString(10, Product.getProductID());
					pstmt.executeUpdate();
				return 1;	
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				
				return -1;
			}
			
		
			// �޼ҵ� : ��ǰ ����
					public int deleteProduct( String ProductID) {
						
						String SQL = "delete from market where productID =?";
						
						try {
						PreparedStatement pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1, ProductID);	
						pstmt.executeUpdate();
						return 1;	
						}
						catch (Exception e) {
							e.printStackTrace();
						}
						
						return -1;
					}
	
	
	
}
