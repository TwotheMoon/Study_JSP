<%@page import="java.util.Calendar"%>
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
	// 1. 게시물의 번호
		request.setCharacterEncoding("euc-kr");
	
		Calendar dateIn = Calendar.getInstance();
		String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
		indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
		indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
		indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
		indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
		indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
		
		int num = Integer.parseInt(request.getParameter("num"));
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
		
		// SQL 작성 : 해당 게시물[포함] 번호 뒤로1 증가
		String strSQL = "UPDATE tableboard set num = num +1 where num >= "+ num;
		PreparedStatement pstmt = conn.prepareStatement(strSQL);
		pstmt.executeUpdate();
		
		// 2. SQL 작성 : 답변 정보 DB 저장
		strSQL = "insert into tableboard(num, name, pass, email, title, contents, writedate, readcount)"
		+ "values(?, ?, ?, ?, ?, ?, ?, ?)";
		
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, num);
		pstmt.setString(2, request.getParameter("name"));
		pstmt.setString(3, request.getParameter("pass"));
		pstmt.setString(4, request.getParameter("email"));
		pstmt.setString(5, request.getParameter("title"));
		pstmt.setString(6, request.getParameter("contents"));
		pstmt.setString(7, indate);
		pstmt.setInt(8, 0);
		pstmt.executeUpdate();	
		response.sendRedirect("listboard.jsp");
	
	%>
</body>
</html>