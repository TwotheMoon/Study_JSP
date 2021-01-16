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
	
	String name   = request.getParameter("name");  
	String pass   = request.getParameter("pass"); 
	String email  = request.getParameter("email");
	String title  = request.getParameter("title");
	String contents  = request.getParameter("contents");
	
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
	indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6 ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
	
	String strSQL2 = "select MAX(num) from tbboard";
	
	PreparedStatement pstmt2 = conn.prepareStatement(strSQL2);
	ResultSet rs = pstmt2.executeQuery();
	
	int num = 1;
	
	rs.next();
	num = rs.getInt(1) + 1;
	
	
	String strSQL ="INSERT INTO tbboard(num , name, pass, email, title, contents, writedate, readcount)"+ "VALUES (? ,?, ?, ?, ?, ?, ?, ?)";
	
 	PreparedStatement pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, num);
 	pstmt.setString(2, name);
	pstmt.setString(3, pass);
	pstmt.setString(4, email);
	pstmt.setString(5, title);
	pstmt.setString(6, contents);
	pstmt.setString(7, indate);
	pstmt.setInt(8, 0);
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();

	response.sendRedirect("listboard.jsp");
	
	%>
	
	
</body>
</html>