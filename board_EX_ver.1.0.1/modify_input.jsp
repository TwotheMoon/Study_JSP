<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%request.setCharacterEncoding("euc-kr"); %>

    <%
    	String num = request.getParameter("num");
    	String pass = request.getParameter("pass");
    
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
    
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String strSQL = "SELECT pass FROM tableboard WHERE num = ?";
    	pstmt = conn.prepareStatement(strSQL);
    	pstmt.setInt(1, Integer.parseInt(num));
    	
    	rs = pstmt.executeQuery();
    	rs.next();
    	
    	String goodpass = rs.getString("pass").trim();
    	if(pass.equals(goodpass)){
    		response.sendRedirect("modify.jsp?num=" + num);
    	}
    	else{
    		response.sendRedirect("modify_pass.jsp?num=" + num);
    		}
    
    rs.close();
    pstmt.close();
    conn.close();
    %>