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
<title> Ȩ������ ���� </title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");
	
	//db ��
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard?serverTimezone=UTC&useSSL=false","root","1234");
	
	String strSQL = "SELECT * FROM member";
	PreparedStatement pstmt = conn.prepareStatement(strSQL);
	ResultSet rs  = pstmt.executeQuery();

	
	// ���� ��
	String logId = (String)session.getAttribute("idkey");
	String logPass = (String)session.getAttribute("passkey");
	
	while(rs.next()){
		String dbid = rs.getString("id");
		String dbpass = rs.getString("pass");
		
		if(logId.equals(dbid) & logPass.equals(dbpass)){
	%>
			<center><h3>�޴�</h3>
	
		<span>�α��� ����</span>
		�α��� id : <%=dbid %>
		<a href="listboard.jsp">[ �Խ��� ]</a>
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