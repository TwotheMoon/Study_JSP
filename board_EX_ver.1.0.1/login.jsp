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
<title> 로그인 메뉴 </title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); 

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");

	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard?serverTimezone=UTC&useSSL=false","root","1234");
	
	String strSQL = "INSERT INTO member(id, pass, email)" + "VALUES(?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(strSQL);
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, email);
	
	pstmt.executeUpdate();
	
	session.setAttribute("idkey", id);
	session.setAttribute("passkey", pass);

%>

	<center><b> 로그인 </b>
	<form action="homepage.jsp" method="post">
	<table>
		<tr>
			<td><b>아이디</b></td>
			<td><input type="text" name="id" placeholder="아이디"></td>
		</tr>
		<tr>
			<td><b>비밀번호</b></td>
			<td><input type="password" name="pass" placeholder="비밀번호"></td>
		</tr>
	</table>
	<table>
		<tr>
			<td>
				<input type="submit" value="로그인">
				<a href="signUp.jsp"><input type="button" value="회원가입"></a>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>