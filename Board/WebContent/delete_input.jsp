<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%	// ������ �Խù� ��ȣ / �� ���������� �Է¹��� ��й�ȣ
		
		String num = request.getParameter("num");
		String pass = request.getParameter("pass");
		

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6 ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
		
		// ������ �Խù���ȣ�� �н����� �˻�
		String strSQL = "select pass from tbboard where num =?";
		PreparedStatement pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(num));
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		if(pass.equals(rs.getString("pass"))){
			
			strSQL = "DELETE from tbboard where num =? ";
			
			pstmt = conn.prepareStatement(strSQL);
			pstmt.setInt(1, Integer.parseInt(num));
			
			pstmt.executeUpdate();
			
			// ������ �޹�ȣ ���� -1�� ����
			strSQL = "update tbboard set num = num-1 where num > ?";
			pstmt = conn.prepareStatement(strSQL);
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.executeUpdate();
			
			response.sendRedirect("listboard.jsp");
		}
		else{
			response.sendRedirect("delete_pass.jsp?num="+num);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
	%>

</body>
</html>