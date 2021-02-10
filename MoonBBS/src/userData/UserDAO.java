package userData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/moonbbs?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}
		catch (Exception e) {
		}
	}	// UserDAO END

	// ȸ������ �޼ҵ�

	public int join(User user) {
		String SQL = "INSERT into user values(?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setInt(6, user.getManager());
			pstmt.executeUpdate();
			return 1;
		}
		catch (Exception e) {
		}
		return -1;
	}	// join END
	
	
	// �α��� �޼ҵ�
	public int login( String logID, String logPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, logID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(logPassword)) {
					return 1; // �α��� ����
				}
				else {
					return 0; // ��й�ȣ �ٸ����
				}
			}
			return -1; // ���̵� ����	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2;	// db����
	} // login END

	
	// ȸ������ ��� �޼ҵ�
	public User userInfo( String userID) {
		String SQL = "SELECT * FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserGender(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				return user;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	} // userInfo END

	
	// ȸ������ ���� �޼ҵ�
	public int deleteUser(String userID) {
		String SQL = "DELETE FROM user WHERE userID = ? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
		return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	} //deleteUser END
	
	
	// ȸ������ ���� �޼ҵ�
	public int updateUser( String userName, String userGender, String userEmail , String userID) 
	{
		String SQL = "UPDATE user SET userName=? , userGender=? , userEmail=? WHERE userID=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			pstmt.setString(2, userGender);
			pstmt.setString(3, userEmail);
			pstmt.setString(4, userID);
			pstmt.executeUpdate();
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}	// updateUser END
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

