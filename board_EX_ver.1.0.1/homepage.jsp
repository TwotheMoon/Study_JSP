<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    session="true"
    %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body{
		display: flex;
		flex-direction:column;
		align-items: center;
		justify-content: center;
		color: #F9EBDE;
		background-color: #815854;
	}
</style>
<meta charset="EUC-KR">
<title> 홈페이지 메인 </title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");
	
	//db 값
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard?serverTimezone=UTC&useSSL=false","root","1234");
	
	String strSQL = "SELECT * FROM member";
	PreparedStatement pstmt = conn.prepareStatement(strSQL);
	ResultSet rs  = pstmt.executeQuery();

	
	// 세션 값
	String logId = (String)session.getAttribute("idkey");
	String logPass = (String)session.getAttribute("passkey");
	
	while(rs.next()){
		String dbid = rs.getString("id");
		String dbpass = rs.getString("pass");
		
		if(logId.equals(dbid) & logPass.equals(dbpass)){
	%>
			<center><h3>메뉴</h3>
	
		<span>로그인 성공</span>
		로그인 id : <%=dbid %>
		<a href="listboard.jsp">[ 게시판 ]</a>
	<% 		
		break;
		}
		else{
			//response.sendRedirect("login.jsp");
		
		}
	}

%>



</body>
</html>