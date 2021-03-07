package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dto.Order;

public class OrderDao {

		private Connection conn;
		private ResultSet rs;
	
	private static OrderDao instance = new OrderDao();
	
		public static OrderDao getinstance() {
			return instance;
		}
	
	public OrderDao(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root","1234");
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	// 메소드 : 주문 추가
	public int setorder( Order order) {
		
		String SQL = "INSERT INTO order VALUES(?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, order.getId());
			pstmt.setString(2, order.getOrder_address());
			pstmt.setString(3, order.getOrder_phone());
			pstmt.setString(4, order.getOrder_requests());
			pstmt.setString(5, order.getOrder_date());
			pstmt.setInt(6, order.getOrder_total_price());
			pstmt.executeUpdate();
			return 1;	
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return -1;
	}
	

					

}
