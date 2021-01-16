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
		String num = request.getParameter("num"); // 선택한 게시물 번호
		String pass = request.getParameter("pass"); // 비밀번호 확인 
		
		// db 연동 
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6?serverTimezone=UTC&useSSL=false","root","1234");
		
		// SQL 작성 = 선택 게시물번호의 비밀번호 검색 
		String strSQL = "SELECT pass FROM tbboard where num =?";
		
		PreparedStatement pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt( num ) );
		
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		if( pass.equals( rs.getString("pass") ) ){	// modify_pass 입력한 패스워드 와  db 쿼리 결과에 저장된 패스워드 비교

			response.sendRedirect("modify.jsp?num="+num) ;		// 동일한 경우 수정 페이지

		}
		else{
			
			response.sendRedirect("modify_pass.jsp?num="+num) ; // 동일하지 않으면 전 페이지
			
		}
		
		
		
		
	%>

</body>
</html>