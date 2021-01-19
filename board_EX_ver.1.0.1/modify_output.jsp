<%@page import="java.util.Calendar"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
	
	PreparedStatement pstmt = null;
	
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
	indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

	pstmt = conn.prepareStatement("UPDATE tableboard SET name=?, pass=?, email=?, title=?, contents=?, writedate=? WHERE num=?");
	pstmt.setString(1, name);
	pstmt.setString(2, pass);
	pstmt.setString(3, email);
	pstmt.setString(4, title);
	pstmt.setString(5, contents);
	pstmt.setString(6, indate);
	pstmt.setInt(7, num);
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("listboard.jsp");
%>