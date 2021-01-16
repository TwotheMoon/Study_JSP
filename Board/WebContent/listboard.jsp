<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
	// db 연동 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6?serverTimezone=UTC&useSSL=false","root","1234");
	String strSQL = "SELECT * FROM tbboard order by num desc";
	PreparedStatement stmt = conn.prepareStatement(strSQL);
	ResultSet rs = stmt.executeQuery(); // select 결과 => 쿼리 저장
	
	
	 %>
	 
	 	<center><font size='3'><b> 게시판 </b></font></TD>
	 	
	 <TABLE  width='600' >
		<TR>
			<TD><hr size='1' noshade>
			</TD>
	 	</TR>
	</TABLE>  
	 	
	 	
		<TABLE cellspacing=1 cellpadding=2 width='600'>      
		<TR bgcolor='cccccc'>      
				<TD><font size=2><center><b>번호</b></center></font></TD>   
				<TD><font size=2><center><b>글 제목</b></center></font></TD>
				<TD><font size=2><center><b>작성자</b></center></font></TD>      
				<TD><font size=2><center><b>작성일</b></center></font></TD>      
				<TD><font size=2><center><b>조회</b></center></font></TD>      
		</TR> 
	<%
	while( rs.next() ){

	int num = rs.getInt("num");
	String name = rs.getString("name");
	String email = rs.getString("email");
	String title = rs.getString("title");
	String writedate = rs.getString("writedate");
	int readcount = rs.getInt("readcount");	
	
	%>
	
		<TR bgcolor='ededed'>     
			<TD align=center><font size=2 color='black'><%=num %></font></TD>     
			<TD align=left>
				<a href="write_output.jsp?num=<%=num %>">
				<font size=2 color="black"><%=title %></font></a>
			</TD>
			<TD align=center>    
				<font size=2 color="black"><%=name %></font></a>     
			</TD>     
			<TD align=center><font size=2><%=writedate %></font>
			</TD>     
			<TD align=center><font size=2><%=readcount %></font>     
		</TR>  
		   	
	<%     
	}	
	%>
	
	</TABLE>     
	                
	<TABLE  width='600' >
		<TR>
			<TD><hr size='1' noshade>
			</TD>
	 	</TR>
	</TABLE>   
	
	
	<TABLE border=0 width=600>
	<TR>
		<TD align=left>		
		</TD>

		<TD align='right'>		
		<a href='write.jsp'>[등록]</a>				
		</TD>
	</TR>
	</TABLE>
	
	  
	
	<%
	rs.close();
	stmt.close();
	conn.close();
	%>  
	
	<a href="listboard.jsp">[이전]</a>
	
	<a href="listboard.jsp"> 페이지번호 </a>
	
	<a href="listboard.jsp">[다음]</a>
			  

</body>
</html>