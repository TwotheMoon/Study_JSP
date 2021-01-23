
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%request.setCharacterEncoding("euc-kr"); %>
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
<title> 게시판 </title>
</head>
<body>

	<%
		String num = request.getParameter("num");
	
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard?serverTimezone=UTC&useSSL=false","root","1234");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
		String strSQL = "SELECT * FROM tableboard WHERE num = ?";
		pstmt = conn. prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(num));
		
		rs = pstmt.executeQuery();
		rs.next();
		
		String name = rs.getString("name");
		String title = rs.getString("title");
		String contents = rs.getString("contents").trim();
		String writedate = rs.getString("writedate");
		int readcount = rs.getInt("readcount");
	%>
	
	<center><b>게시판</b>
	
	<table border="0" width="700">
		<tr>
			<td width="100" bgcolor="#815854"> 작성자 : <%=name %> </td>
			<td bgcolor="#815854">작성일: <%=writedate %>, 조회수: <%=readcount %>"  </td>
		</tr>
	</table>
	
	<table border="0" width="700">
		<tr>
			<td bgcolor="#815854">
				<b><%=title %></b>
			</td>
		</tr>
	</table>

	<table border="0" width="700">
		<tr>
			<td bgcolor="#815854"><%=contents %></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td bgcolor="#815854"></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td>
				<hr size="1" noshade>
			</td>
		</tr>
	</table>
	
	<table border="0" width="700">
		<tr>
			<td align="left">
				<a href="modify_pass.jsp?num=<%=num %>">[수정하기]</a>
				<a href="delete_pass.jsp?num=<%=num %>">[삭제하기]</a>
			</td>
			<td align="right">
				<a href="write.jsp">[글쓰기]</a>
				<a href="listboard.jsp">[목록보기]</a>
			</td>
		</tr>
	</table>

<%
	strSQL = "UPDATE tableboard SET readcount=readcount+1 WHERE num = ?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate();
		}
		catch(SQLException e){
			out.print("SQL에러" + e.toString());
		}
		catch(Exception ex){
			out.print("jsp에러" + ex.toString());
		}
		finally{
			rs.close();
			pstmt.close();
			conn.close();
		}


%>


</body>
</html>