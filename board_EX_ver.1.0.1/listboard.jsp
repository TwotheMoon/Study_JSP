<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
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
<title> �Խù� ��� </title>
</head>
<body>

	<%
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
	
	Statement stmt = conn.createStatement();
	
	String strSQL = "select * from tableboard order by num desc";
	ResultSet rs = stmt.executeQuery(strSQL);
	
	%>
	
	<center><table width="700">
		<tr>
			<td><hr size="1" noshade></td>
		</tr>
	</table>

	<table width="700">
		<tr>
			<td align="center">��ȣ</td>
			<td align="center">�� ����</td>
			<td align="center">�ۼ���</td>
			<td align="center">�ۼ���</td>
			<td align="center">��ȸ</td>
		</tr>
		<%
		while(rs.next()){
			int num = rs.getInt("num");
			String name = rs.getString("name");
			String email = rs.getString("email");
			String title = rs.getString("title");
			String writedate = rs.getString("writedate");
			int readcount = rs.getInt("readcount");
		
		%>
		<tr>
			<td align="center" bgcolor="#815854"><%=num %></td>
			<td align="center" bgcolor="#815854">
				<a href="write_output.jsp?num=<%=num %>">
				<%=title %></a>
			</td>
			<td align="center" bgcolor="#815854"><%=name %></td>
			<td align="center" bgcolor="#815854"><%=writedate %></td>
			<td align="center" bgcolor="#815854"><%=readcount %></td>
		</tr>
		<% 
		}
		%>
	</table>
	
	<table width="700">
		<tr>
			<td>
				<hr size="1" noshade>
			</td>
		</tr>	
	</table>
	
	<table border="0" width="700">
		<tr>
			<td align="left"></td>
			<td align="right"><a href="write.jsp">[���]</a> </td>
		</tr>
	</table>
	
	<%
	rs.close();
	stmt.close();
	conn.close();
	%>
	
	<a href="listboard.jsp">[����]</a>
	<a href="listboard.jsp">��������ȣ</a>
	<a href="listboard.jsp">[]����]</a>
	
	
	
	
	
	
	
	
</body>
</html>