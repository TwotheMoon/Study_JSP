<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	// 매개변수 요청
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	
	// db 연동
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6 ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
	
	// 현재 게시물번호의 비밀번호 확인
	String strSQL = "select pass from tbboard where num = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
		String rspass = rs.getString("pass");	// 쿼리결과 패스워드 필드 호출
		if(pass.equals(rspass)){	// 폼에서 입력한 패스워드와 쿼리결과에 있는 패스워드 동일하면
			strSQL = "delete from tbboard where num =?";
			pstmt = conn.prepareStatement(strSQL);
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.executeUpdate();
%>
			<jsp:forward page="게시판목록.jsp"></jsp:forward>
<%					
		}
		else{
%>
			<jsp:forward page="게시판목록.jsp"></jsp:forward>
<%				
		}
		rs.close();
		pstmt.close();
		conn.close();
%>

 
		