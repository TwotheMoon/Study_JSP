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
	
	// 댓글 등록 날짜
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
	indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
	
	// 게시물 번호
	int num = Integer.parseInt(request.getParameter("num"));
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
	
		int num_plus = 0;	
	
		String strSQL = "SELECT num FROM plus ORDER BY num DESC";
		PreparedStatement pstmt = conn.prepareStatement(strSQL);
		ResultSet rs = pstmt.executeQuery();
		
			rs.next();
			num_plus = 1;
			strSQL = "SELECT max(num) from plus";	// 댓글번호의 마지막 번호 구하기
			
			rs = pstmt.executeQuery(strSQL);
			rs.next();
			num_plus = rs.getInt(1)+1;				// 다음번호
			
	
	strSQL = "INSERT INTO plus( num, id, name, contents, writedate)" + "values(?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, num_plus);  // 댓글 번호
	pstmt.setString(2, request.getParameter("num"));	// 해당 게시물 번호
	pstmt.setString(3, request.getParameter("plus_name"));	// 댓글 작성자
	pstmt.setString(4, request.getParameter("plus_contents"));	// 댓글 내용
	pstmt.setString(5, indate);
	
	pstmt.executeUpdate();
	response.sendRedirect("write_output.jsp?num="+num);
	// forword 방식 : 페이지 바꾸기
	// response.sendRedirect(링크) : 페이지 바꾸기 [URL]
	
	%>

</body>
</html>