<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Calendar"%>
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
	request.setCharacterEncoding("euc-kr");
	
	// ��� ��� ��¥
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
	indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
	
	// �Խù� ��ȣ
	int num = Integer.parseInt(request.getParameter("num"));
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
	
		int num_plus = 0;	
	
		String strSQL = "SELECT num FROM plus ORDER BY num DESC";
		PreparedStatement pstmt = conn.prepareStatement(strSQL);
		ResultSet rs = pstmt.executeQuery();
		
			rs.next();
			num_plus = 1;
			strSQL = "SELECT max(num) from plus";	// ��۹�ȣ�� ������ ��ȣ ���ϱ�
			
			rs = pstmt.executeQuery(strSQL);
			rs.next();
			num_plus = rs.getInt(1)+1;				// ������ȣ
			
	
	strSQL = "INSERT INTO plus( num, id, name, contents, writedate)" + "values(?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, num_plus);  // ��� ��ȣ
	pstmt.setString(2, request.getParameter("num"));	// �ش� �Խù� ��ȣ
	pstmt.setString(3, request.getParameter("plus_name"));	// ��� �ۼ���
	pstmt.setString(4, request.getParameter("plus_contents"));	// ��� ����
	pstmt.setString(5, indate);
	
	pstmt.executeUpdate();
	response.sendRedirect("write_output.jsp?num="+num);
	// forword ��� : ������ �ٲٱ�
	// response.sendRedirect(��ũ) : ������ �ٲٱ� [URL]
	
	%>

</body>
</html>