<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	
	String num = request.getParameter("num"); 
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6?serverTimezone=UTC&useSSL=false","root","1234");
	
	String strSQL = "SELECT * FROM tbboard WHERE num = ?";
	PreparedStatement pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	String name = rs.getString("name");
	String title = rs.getString("title");
	String contents = rs.getString("contents").trim();
	String writedate = rs.getString("writedate");
	int readcount = rs.getInt("readcount");

	%>
	
	<center><font size='3'><b> �Խ��� </b></font>

	<TABLE  width='600' >
		<TR>
			<TD><hr size='1' noshade>
			</TD>
	 	</TR>
	</TABLE>
	
	<TABLE border='0' width='600'>
	<TR>
    		<TD align='left'>
      		<font size='2'> �ۼ��� : <%=name %></font>
    		</TD>
    		
    		<TD align=right>
      		<font size='2'>�ۼ���: <%=writedate %>, ��ȸ��: <%=readcount %></font>
    		</TD>
    	</TR>
	</TABLE>
	
	
				<TABLE border='0' cellspacing=3 cellpadding=3 width='600'>
					<TR bgcolor='cccccc'>
						<TD align='center'>
				    		<font size='3'><b><%=title %></font>
						</TD>
					</TR>
				</TABLE>
				
									<TABLE border='0' cellspacing=5 cellpadding=10 width='600'>
										<TR bgcolor='ededed'>
											<TD><font size='2' color=''><%=contents %></font>
											</TD>
										</TR>
									</TABLE>
	
	
					<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
					  	<TR>
					  		<TD><hr size='1' noshade>
					  		</TD>
					  	</TR>
					</TABLE>
					
					
					<TABLE border='0' width='600'>
						<TR>
						
							<TD align='left'>
									<a href="modify_pass.jsp?num=<%=num %>">[�����ϱ�]</a>
									<a href="delete_pass.jsp?num=<%=num %>">[�����ϱ�]</a>
							</TD>
					
							<TD align='right'>
								<a href='write.jsp'>[�۾���]</a>
								<a href='listboard.jsp'>[��Ϻ���]</a>
					 		</TD>
						</TR>
					</TABLE>
					
	<% //��ȸ�� 1 ���� 
		strSQL = "UPDATE tbboard SET readcount=readcount+1 WHERE num = ?";
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(num));
		pstmt.executeUpdate();
		
		rs.close();
		pstmt.close();
		conn.close();
	
	%>
	

</body>
</html>