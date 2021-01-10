<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.* , java.util.*" %>


	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<%
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");

	
	Calendar datein = Calendar.getInstance();	// 날짜 생성
	
		// 날짜 호출
	String writedate = Integer.toString(datein.get(Calendar.YEAR) ) + "-";
	writedate = writedate + Integer.toString(datein.get(Calendar.MONTH)+1 ) + "-";
	writedate = writedate + Integer.toString(datein.get(Calendar.DATE) ) + "  ";
		
		// 시간 호출
	writedate = writedate + Integer.toString(datein.get(Calendar.HOUR_OF_DAY)) + ":";
	writedate = writedate + Integer.toString(datein.get(Calendar.MINUTE)) + ":";
	writedate = writedate + Integer.toString(datein.get(Calendar.SECOND)) + "  ";
	
	
	// db 연동

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6 ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
		
		PreparedStatement pstmt;
		
		String SQL = "Insert into tbboard(name,pass,email,title,contents,writedate,readcount)"+"Values(?,?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(SQL);
		
		pstmt.setString(1, name);
		pstmt.setString(2, pass);
		pstmt.setString(3, email);
		pstmt.setString(4, title);
		pstmt.setString(5, contents);
		pstmt.setString(6, writedate);
		pstmt.setInt(7, 0);

		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		//response.sendRedirect("게시판목록.jsp");
	
	%>
	
	<jsp:forward page="게시판목록.jsp"></jsp:forward>