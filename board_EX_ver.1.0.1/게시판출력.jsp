<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 게시판 </title>
</head>
<body>

	<%
		// "URL?매개뱐스=값"
		// 링크로부터 매개변수 요청
		String num = request.getParameter("num"); // num 값을 이용한 db값 검색
			
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6 ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
		
		String strSQL = "select * from tbboard where num = ?";
		PreparedStatement pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(num));
		
		ResultSet rs = pstmt.executeQuery(); // 쿼리 실행
		
		rs.next();
			String name = rs.getString("name");
			String title = rs.getString("title");
			String contents = rs.getString("contents");
			String writedate = rs.getString("writedate");
			String readcount = rs.getString("readcount");
	%>
	
	<center><font size="3"> 게시판 </font></center>
	<table width="600">
		<tr>
			<td><hr size="1"></td>
		</tr>
	</table>
	<table width="600">
		<tr>
			<td align="left">
				<font size="2">작성자 : <%=name %></font>
			</td>
			<td align="right">
				<font size="2">작성일 : <%=writedate %> , 조회수 : <%=readcount %></font>
			</td>
		</tr>
	</table>
	<table width="600">
		<tr bgcolor="cccccc">
			<td align="center">
				<font size="3"><%=title %></font>
			</td>
		</tr>	
	</table>
	<table width="600">
		<tr>
			<td>
				<font size="2"><%=contents %></font>
			</td>
		</tr>
	</table>
	<table width="600">
		<tr>
			<td><hr size="1"></td>
		</tr>
	</table>
	<table width="600">
		<tr>
			<td align="left">
				<a href="게시물수정확인.jsp?num=<%=num%>">[수정하기]</a>
				<a href="게시물삭제확인.jsp?num=<%=num%>">[삭제하기]</a>
			</td>
			<td align="right">
				<a href="게시판등록.jsp">[글쓰기]</a>
				<a href="게시판목록.jsp">[목록보기]</a>
			</td>
		</tr>
	</table>
	<%
		strSQL = "update tbboard set readcount = readcount+1 where num =?";
		
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(num));
		pstmt.executeUpdate();
		
		rs.close();
		pstmt.close();
		conn.close();
	%>
	
</body>
</html>