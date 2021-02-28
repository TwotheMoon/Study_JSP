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
		
		String SQL = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
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
			pstmt.setInt(10, 0);
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
	
	
	
	// 메소드 : 모든 제품 호출
		public ArrayList<Product> getAllProducts(){
			ArrayList<Product> listProducts = new ArrayList<Product>();
			
				String SQL = "SELECT * FROM market";
				try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
					// 쿼리 : 검색 결과의 레코드 [ 테이블 가로 단위]
				while(rs.next()) {	// 쿼리 결과의 레코드가 null 일때 까지 반복
					
					// 한개 레코드의 모든 필드를 각 객체에 대입
					Product product = new Product();
					product.setProductID(rs.getString(1));
					product.setPname(rs.getString(2));
					product.setPprice(rs.getInt(3));
					product.setDescription(rs.getString(4));
					product.setManufacturer(rs.getString(5));
					product.setCategory(rs.getString(6));
					product.setPinstock(rs.getInt(7));
					product.setconditions(rs.getString(8));
					product.setFilename(rs.getString(9));
					
					listProducts.add(product);
				}
			}catch (Exception e) {
				
			}
			return listProducts;
		}
		
		
		// 메소드 : 제품id에 해당하는 제품 정보 반환
			public Product getProduct( String ProductID) {
				
				Product product = null;
				
					String SQL = "SELECT * FROM market WHERE productID =?";
					
					try {
						PreparedStatement pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1, ProductID);
						rs = pstmt.executeQuery();
						
						if(rs.next()) {	// 쿼리 시작 null 부터
							
							product = new Product();
							product.setProductID(rs.getString(1));
							product.setPname(rs.getString(2));
							product.setPprice(rs.getInt(3));
							product.setDescription(rs.getString(4));
							product.setManufacturer(rs.getString(5));
							product.setCategory(rs.getString(6));
							product.setPinstock(rs.getInt(7));
							product.setconditions(rs.getString(8));
							product.setFilename(rs.getString(9));
							product.setActivation(rs.getInt(10));
							
							return product;
						}
					}catch (Exception e) {
						e.getStackTrace();
					}
				
				return product;
			}
		
		
		
		// 메소드 : 제품 수정
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
			
		
			// 메소드 : 제품 삭제
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
