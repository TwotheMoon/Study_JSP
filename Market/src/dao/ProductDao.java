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
		
	
	// �ٸ� �������� dao ��ü ����
	private static ProductDao instance = new ProductDao();
	
		public static ProductDao getinstance() {
			return instance;
		}
	
	public ProductDao(){
		try {			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root","1234");
		}catch (Exception e) {
		
		}
	}

	// �޼ҵ� : ��� ��ǰ ȣ��
	public ArrayList<Product> getAllProducts(){
		ArrayList<Product> listProducts = new ArrayList<Product>();
		
			String SQL = "SELECT * FROM market ";
			try {							
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
				// ���� : �˻� ����� ���ڵ� [ ���̺� ���� ����]
			while(rs.next()) {	// ���� ����� ���ڵ尡 null �϶� ���� �ݺ�
				
				// �Ѱ� ���ڵ��� ��� �ʵ带 �� ��ü�� ����
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
				product.setActivation(rs.getInt(10));
				
				listProducts.add(product);
			}
		}catch (Exception e) {
			
		}
		return listProducts;
	}
	
	
	// �޼ҵ� : ��ǰid�� �ش��ϴ� ��ǰ ���� ��ȯ
		public Product getProduct( String ProductID) {
			
			Product product = null;
			
				String SQL = "SELECT * FROM market WHERE productID =?";
				
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, ProductID);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {	// ���� ���� null ����
						
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
	
	
	// �޼ҵ� : ��ǰ �߰�
	public int setProduct( Product Product) {
		
		String SQL = "INSERT INTO market VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
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

				// �˻� ��ǰ ȣ��
				public ArrayList<Product> searchGetALLProducts(String key, String keyword){
					ArrayList<Product> listProducts = new ArrayList<Product>();
					
						String SQL = "SELECT * FROM market where "+key+" like '%"+keyword+"%'";
																//�˻����� �ʵ忡 ���Ե� ���ڵ� ã�� 
																//�ʵ�� like '%�˻���%'
						try {
						PreparedStatement pstmt = conn.prepareStatement(SQL);
						rs = pstmt.executeQuery();
							// ���� : �˻� ����� ���ڵ� [ ���̺� ���� ����]
						while(rs.next()) {	// ���� ����� ���ڵ尡 null �϶� ���� �ݺ�
							
							// �Ѱ� ���ڵ��� ��� �ʵ带 �� ��ü�� ����
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
				
				// �޼ҵ� : ��ǰ Ȱ��ȭ ����
				public int activation( String ProductID) {
					
					String SQL = "select activation from market where productID = ?";
					
					try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, ProductID);	
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						// �Ǹ��� 1 => ���Ǹ� 0 
							if(rs.getInt("activation") == 1) {
								// ����
								SQL = "update market set activation = 0 where productID =?";
								PreparedStatement pstmt2 = conn.prepareStatement(SQL);
								pstmt2.setString(1, ProductID);
								pstmt2.executeUpdate();
								return 1;
							}
						// ���Ǹ� 0 => �Ǹ��� 1
					}
						if(rs.getInt("activation") == 0) {
							// ����
							SQL = "update market set activation = 1 where productID =?";
							PreparedStatement pstmt2 = conn.prepareStatement(SQL);
							pstmt2.setString(1, ProductID);
							pstmt2.executeUpdate();
							return 1;
					}
					return -1;	
					}
					catch (Exception e) {
						e.printStackTrace();
					}
					
					return -1;
				}
				
				// �޼ҵ� : ��ǰ Ȱ��ȭ ����
				public int soldout() {
					
					
					String SQL = "update market set activation = 2 where pinstock = 0";
					try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.executeUpdate();
					return 1;
					}
					catch (Exception e) {
						e.printStackTrace();
					}
					return -1;
				}
			
}
	