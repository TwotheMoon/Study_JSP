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
			// 게시물 수정 페이지에서 입력받은 값 호출 		
			int num = Integer.parseInt(request.getParameter("num") );
			String name = request.getParameter("name");
			String pass = request.getParameter("pass");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
	
			// 수정한 날짜 
			Calendar dateIn = Calendar.getInstance();
			String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
			indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
			indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
			indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
			indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
			indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
				
			// db 연동 
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6?serverTimezone=UTC&useSSL=false","root","1234");
			
			// SQL 작성 
			PreparedStatement pstmt = conn.prepareStatement( 
					"UPDATE tbboard SET name=? , pass=? , email=? , title=? , contents=? , writedate=? where num = ?" );
			
			// SQL 실행   // ? 갯수만큼 설정 값 설정 
			pstmt.setString(1, name);
			pstmt.setString(2, pass);
			pstmt.setString(3, email);
			pstmt.setString(4, title);
			pstmt.setString(5, contents);
			pstmt.setString(6, indate);
			pstmt.setInt( 7, num);	// 조건 = ?
		
			pstmt.executeUpdate();
			
			response.sendRedirect("listboard.jsp"); //  해당 페이지 넘기기
			
	
	
	
	%>

	




</body>
</html>