<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<body>
    <%
    
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6 ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
		
		String strSQL = "Select * from tbboard order by num desc";

		PreparedStatement stmt = conn.prepareStatement(strSQL);
		
		ResultSet rs = stmt.executeQuery();
		%>
		
    <center><font size="3"><b>�Խ���</b></font></center>
    
   <center><table width="600" cellpadding="2" cellspacing="1" border="0" >
    	<tr bgcolor="cccccc">
    		<td><font size="2"><center><b>��ȣ</b></center></font></td>
    		<td align="left"><font size="2"><center><b>�� ����</b></center></font></td>
    		<td><font size="2"><center><b>�ۼ���</b></center></font></td>
    		<td><font size="2"><center><b>�ۼ���</b></center></font></td>
    		<td><font size="2"><center><b>��ȸ</b></center></font></td>
    	</tr>		
		
		<%
		while( rs.next()){
    		
    		int num = rs.getInt("num");
    		String name = rs.getString("name");
    		String email = rs.getString("email");
    		String title = rs.getString("title");
    		String writedate = rs.getString("writedate");
    		int readcount = rs.getInt("readcount");
    	%>
    	
    	<tr>
    		<td align="center"><font size="2" color="black"><%=num%></font></td>
    		<td align="center">
    			<a href="�Խ������.jsp?num=<%=num%>">
    				<font size="2" color="black"><%=title%></font>
    			</a>
    		</td>
    		<td align="center"><font size="2" color="black"><%=name%></font></td>
    		<td align="center"><font size="2" color="black"><%=writedate%></font></td>
    		<td align="center"><font size="2" color="black"><%=readcount%></font></td>
    	</tr>
    		<%
    		}
		
	
    %>
	</table></center>
	
	<center><table width="600">
		<tr>
		<td><hr size="1" noshade> </td>
		</tr>
	</table></center>
	
	<center><table width="600">
		<tr>
			<td align="left"></td>
			<td align="right">
				<a href="�Խ��ǵ��.jsp">�۾���</a>
			</td>
		</tr>
	</table></center>
	<%
	rs.close();
	stmt.close();
	conn.close();
	
	%>
</body>