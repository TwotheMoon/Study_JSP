package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import dto.Product;

public class ProductDao {

		private Connection conn;
		private ResultSet rs;
		
	
	// �ٸ� �������� dao ��ü ����
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

	// �޼ҵ� : ��� ��ǰ ȣ��
	public ArrayList<Product> getAllProducts(){
		ArrayList<Product> listProducts = new ArrayList<Product>();
		
		return listProducts;
	}
	
	// �޼ҵ� : ��ǰid�� �ش��ϴ� ��ǰ ���� ��ȯ
	public Product getProduct( String ProductID) {
		Product product = null;
		
		return product;
	}






}
	