<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String num = request.getParameter("num"); // ������ �Խù� ��ȣ
		String pass = request.getParameter("pass"); // ��й�ȣ Ȯ�� 
		
		// db ���� 
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6?serverTimezone=UTC&useSSL=false","root","1234");
		
		// SQL �ۼ� = ���� �Խù���ȣ�� ��й�ȣ �˻� 
		String strSQL = "SELECT pass FROM tbboard where num =?";
		
		PreparedStatement pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt( num ) );
		
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		if( pass.equals( rs.getString("pass") ) ){	// modify_pass �Է��� �н����� ��  db ���� ����� ����� �н����� ��

			response.sendRedirect("modify.jsp?num="+num) ;		// ������ ��� ���� ������

		}
		else{
			
			response.sendRedirect("modify_pass.jsp?num="+num) ; // �������� ������ �� ������
			
		}
		
		
		
		
	%>

</body>
</html>