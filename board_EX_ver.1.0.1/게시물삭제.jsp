<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	// �Ű����� ��û
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	
	// db ����
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6 ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
	
	// ���� �Խù���ȣ�� ��й�ȣ Ȯ��
	String strSQL = "select pass from tbboard where num = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
		String rspass = rs.getString("pass");	// ������� �н����� �ʵ� ȣ��
		if(pass.equals(rspass)){	// ������ �Է��� �н������ ��������� �ִ� �н����� �����ϸ�
			strSQL = "delete from tbboard where num =?";
			pstmt = conn.prepareStatement(strSQL);
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.executeUpdate();
%>
			<jsp:forward page="�Խ��Ǹ��.jsp"></jsp:forward>
<%					
		}
		else{
%>
			<jsp:forward page="�Խ��Ǹ��.jsp"></jsp:forward>
<%				
		}
		rs.close();
		pstmt.close();
		conn.close();
%>

 
		