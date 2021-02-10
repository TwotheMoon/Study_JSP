package bbsData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	
	// �Խù� ��ȣ(bbsID) �޼ҵ�
	public int getBbsNum() {
		String SQL = "SELECT MAX(bbsID) FROM bbs";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}	// ù �Խù�
			
			return 1;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	// �Խù� ��ϳ�¥ �޼ҵ�
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
		return ""; // db �����̸� ����
	}
	
	// �Խù� ���
	public int write(String bbsTitle , String bbsContents , String bbsuserID , String File ) {
		String SQL = "INSERT INTO bbs VALUES(?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getBbsNum());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsContents);
			pstmt.setString(4, bbsuserID);
			pstmt.setString(5, getdate());
			pstmt.setInt(6, 1); // �Խù� ǥ�ÿ��� // ��� = 1 // �Ұ� = 0
			pstmt.setString(7, File);
			pstmt.executeUpdate();
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
