<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> �Խ��� </title>
</head>
<body>

	<%
		// "URL?�Ű�����=��"
		// ��ũ�κ��� �Ű����� ��û
		String num = request.getParameter("num"); // num ���� �̿��� db�� �˻�
			
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6 ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
		
		String strSQL = "select * from tbboard where num = ?";
		PreparedStatement pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(num));
		
		ResultSet rs = pstmt.executeQuery(); // ���� ����
		
		rs.next();
			String name = rs.getString("name");
			String title = rs.getString("title");
			String contents = rs.getString("contents");
			String writedate = rs.getString("writedate");
			String readcount = rs.getString("readcount");
	%>
	
	<center><font size="3"> �Խ��� </font></center>
	<table width="600">
		<tr>
			<td><hr size="1"></td>
		</tr>
	</table>
	<table width="600">
		<tr>
			<td align="left">
				<font size="2">�ۼ��� : <%=name %></font>
			</td>
			<td align="right">
				<font size="2">�ۼ��� : <%=writedate %> , ��ȸ�� : <%=readcount %></font>
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
				<a href="�Խù�����Ȯ��.jsp?num=<%=num%>">[�����ϱ�]</a>
				<a href="�Խù�����Ȯ��.jsp?num=<%=num%>">[�����ϱ�]</a>
			</td>
			<td align="right">
				<a href="�Խ��ǵ��.jsp">[�۾���]</a>
				<a href="�Խ��Ǹ��.jsp">[��Ϻ���]</a>
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