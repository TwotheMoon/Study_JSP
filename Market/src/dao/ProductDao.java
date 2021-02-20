package dao;

import java.awt.Stroke;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dto.Product;

public class ProductDao {

		private Connection conn;
		private ResultSet rs;
		
	
	// 다른 페이지에 dao 객체 생성
	private static ProductDao instance = new ProductDao();
	
		public static ProductDao getinstance() {
			return instance;
		}
	
	public ProductDao(){
		try {			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC");
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

	// 메소드 : 모든 제품 호출
	public ArrayList<Product> getAllProducts(){
		ArrayList<Product> listProducts = new ArrayList<Product>();
		
		return listProducts;
	}
	
	// 메소드 : 제품id에 해당하는 제품 정보 반환
	public Product getProduct( String ProductID) {
		Product product = null;
		
		return product;
	}
	
	
	// 메소드 : 제품 추가
	public int setProduct( Product Product) {
		
		String SQL = "INSERT INTO market VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
		
		try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, Product.getProductID());
		pstmt.setString(2, Product.getPname());
		pstmt.setInt(3, Product.getPprice());
		pstmt.setString(4, Product.getDescription());
		pstmt.setString(5, Product.getManufacturer());
		pstmt.setString(6, Product.getCategory());
		pstmt.setInt(7, Product.getPinstock());
		pstmt.setString(8, Product.getconditions());
		pstmt.setString(9, Product.getFilename());
		pstmt.setInt(10, Product.getActivation());
			pstmt.executeUpdate();
		return 1;	
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return -1;
	}





}
	