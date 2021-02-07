package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class BbsDAO {

		private Connection conn;
	
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
			
			String SQL = "select now()"; // DB �Լ� = now : ���糯¥/�ð� //DATE : ��¥ // TIME : �ð�
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
		String SQL = "select MAX(bbsID) from bbsboard";	// MAX �ִ밪 �Լ�
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
				
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
	public int write( String bbsTitle , String bbsContents, String bbsuserID , String File) {
		String SQL = "insert into bbsboard values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getnext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsContents);
			pstmt.setString(4, bbsuserID);
			pstmt.setString(5, getdate());
			pstmt.setInt(6, 1);	// �Խù� ���� // ��� = 1 // �Ұ� = 0
			pstmt.setString(7, File);
			pstmt.executeUpdate();
			return 1;
		}
		catch (Exception e) {
		}
	return -1; 	
	}
	
	
	// �Խù� ��Ϻ��� => ��� �Խù� �˻� => Arraylist
	public ArrayList<Bbs> getlist( int pagenumber) {
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		
		String SQL = "select * from bbsboard where and bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getnext() - (pagenumber -1) * 10);
			
			rs = pstmt.executeQuery();
		
			while(rs.next()) {	// ��� ���� ����
				
				Bbs bbs = new Bbs();	// �Խù� ��ü
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsContents(rs.getString(3));
				bbs.setBbsuserID(rs.getString(4));
				bbs.setBbsData(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
			
				list.add(bbs);	// list => �ּҰ� �ּҰ� ...
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	
	
	// ���� ������ ���� Ȯ�� �޼ҵ�
	public boolean nextpage(int pagenumber) {
		
		String SQL = "SELECT * from bbsboard where bbsID < ? AND bbsAvailable =1";
		
		try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, getnext() - (pagenumber-1) * 10);
						// ��������ȣ - (���������� - 1) * ���� ��������
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			
			return true; // ���� ������ ������ // ���� ����� ���� ������
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;	// ������ ������	// ���� ����� ���� ������
	}
	
	// �Խù� ��ȣ�� �ش��ϴ� ������ ���
	public Bbs getbbs(int bbsID) {
		
		String SQL = "SELECT * from bbsboard where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsContents(rs.getString(3));
				bbs.setBbsuserID(rs.getString(4));
				bbs.setBbsData(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsFile(rs.getString(7));
				return bbs;		
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null ; // db���� // ��ȣ�� �ش��ϴ� �Խù��� �������� ������
		
		
	}
	
	// �Խù� ����
	public int update( String bbsTitle, String bbsContents ,int bbsID) {
		
		String SQL = "UPDATE bbsboard set bbsTitle=? , bbsContents=? where bbsID =?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContents);
			pstmt.setInt(3, bbsID);
			pstmt.executeUpdate();
			return 1;	// ������Ʈ ����
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1;	// db���� ������Ʈ ����
	}
	
	
	// �Խù� ����
	public int delete(int bbsID) {
		
		String SQL = "UPDATE bbsboard set bbsAvailable=0 where bbsID=?";
		
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		
		pstmt.setInt(1, bbsID);
		pstmt.executeUpdate();
		
		return 1;
		}
	catch (Exception e) {
		// TODO: handle exception
	}
	 return -1;
	}
	
	
	// �������� �޼ҵ� 
	// �Խù� ��Ϻ��� => ��� �Խù� �˻� => Arraylist
		public ArrayList<Bbs> getMylist( int pagenumber) {
			ArrayList<Bbs> list = new ArrayList<Bbs>();
			
			String SQL = "select * from bbsboard where userID=? and bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				
				pstmt.setInt(1, getnext() - (pagenumber -1) * 10);
				
				rs = pstmt.executeQuery();
			
				while(rs.next()) {	// ��� ���� ����
					
					Bbs bbs = new Bbs();	// �Խù� ��ü
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setBbsContents(rs.getString(3));
					bbs.setBbsuserID(rs.getString(4));
					bbs.setBbsData(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
				
					list.add(bbs);	// list => �ּҰ� �ּҰ� ...
				}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			return list;
		}
}