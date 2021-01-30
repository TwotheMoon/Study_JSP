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
	
	// �Խù� ��ϳ�¥ �޼ҵ� = �����ð� [DB�ð�����] �޼ҵ�
		public String getdate() {
			
			String SQL = "select now()"; // DB �Լ� = now : ���糯¥
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					return rs.getString(1); // �����̸� ���� ��� ����
				}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			return ""; // db �����̸� ����
		}
		
	// �Խù� ��ȣ �޼ҵ�
	public int getnext() {	// �Խù��� ��������ȣ
		String SQL = "select MAX(bbsID) from bbsboard ";
		
		try {
			PreparedStatement pstmtPreparedStatement = conn.prepareStatement(SQL);
				
				rs = pstmt.executeQuery();

				if(rs.next()) {
					return rs.getInt(1) + 1;
					
				}
				// ù �Խù�
				return 1;	// 1�� ����
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1; // db����
	}
		
		
	// �Խù� ���
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