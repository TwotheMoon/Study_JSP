package USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class UserDAO {

		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public UserDAO() {
			
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
	// �α��� �޼ҵ�
	public int login( String logID , String logPassword ) {	// �α��� �޼ҵ� // �α���â���� �Է°� 
		
		String SQL = "SELECT userPassword FROM user where userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, logID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(logPassword)) {
					return 1;	// �α��� ����
				}
				else {
					return 0;	// ��й�ȣ �ٸ����
				}
			}
			return -1; // ���̵� ����
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -2;	// db����
	}

	//ȸ������ �޼ҵ�
	public int join(User user)  {
		String SQL = "insert into user values( ?, ?, ?, ?, ?)";
		
		try{
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, user.getUserID()); // userID : Ű��Ű [PK] : �ߺ��� �ʵ�
		pstmt.setString(2, user.getUserPassword());
		pstmt.setString(3, user.getUserName());
		pstmt.setString(4, user.getUserGender());
		pstmt.setString(5, user.getUserEmail());
		pstmt.executeUpdate();
		return 1; // ������Ʈ ���� ���� // ȸ������ ����
		}
	catch (Exception e) {
		// TODO: handle exception
	}
	return -1; // db���� // �ߺ� ������
	}
	
}