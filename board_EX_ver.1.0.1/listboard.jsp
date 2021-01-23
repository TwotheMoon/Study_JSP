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
		color: #F9EBDE;
		background-color: #815854;
	}
	.search{
		outline: none;
	}
	.search:focus
	{	
		outline: none;
	}
	a{
		text-decoration: none;	
		color: tomato;
	}
	
</style>

<script language="javascript">
function Check() {
	if(Form.keyword.value.length < 1){
		alert("검색어를 입력하세요.");
		Form.keyword.focus();
			return false;
	}
}
</script>
<meta charset="EUC-KR">
<title> 게시물 목록 </title>
</head>
<body>

	<%
	String key = request.getParameter("key");
	String keyword = request.getParameter("keyword");
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int listSize = 5;
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * listSize + 1;
	int endRow = currentPage * listSize;
	int lastRow = 0;
	int i = 0;
	String strSQL = "";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
	
	Statement stmt = conn.createStatement();
	ResultSet rs = null;
	
	if( key == null || keyword == null){
		strSQL = "SELECT count(*) FROM tableboard";
	}else{
		strSQL = "SELECT count(*) FROM tableboard WHERE " + key + " like '%" + keyword + "%'";
	}
	rs = stmt.executeQuery(strSQL);
	rs.next();
	lastRow = rs.getInt(1);
	
	rs.close();
	%>
	
	<center><table width="700">
		<tr>
			<td><hr size="1" noshade></td>
		</tr>
	</table>

	<table width="700">
		<tr>
			<td align="center">번호</td>
			<td align="center">글 제목</td>
			<td align="center">작성자</td>
			<td align="center">작성일</td>
			<td align="center">조회</td>
		</tr>
		<%
		if(lastRow > 0){
			if(key == null || keyword == null){
				strSQL = "SELECT * FROM tableboard WHERE num BETWEEN " + startRow + " and " + endRow;
				rs = stmt.executeQuery(strSQL);				
			}else{
				strSQL = "SELECT * FROM tableboard WHERE " + key + " like '%" + keyword + "%'";
				rs = stmt.executeQuery(strSQL);
			}
			
			for(i = 1; i < listSize; i++){
				while(rs.next()){
					
					int listnum = rs.getInt("num");
					String name = rs.getString("name");
					String email = rs.getString("email");
					String title = rs.getString("title");
					String writedate = rs.getString("writedate");
					int readcount = rs.getInt("readcount");
			
		
		%>
		<tr>
			<td align="center" bgcolor="#815854"><%=listnum %></td>
			<td align="center" bgcolor="#815854">
				<a href="write_output.jsp?num=<%=listnum %>">
				<%=title %></a>
			</td>
			<td align="center" bgcolor="#815854"><%=name %></td>
			<td align="center" bgcolor="#815854"><%=writedate %></td>
			<td align="center" bgcolor="#815854"><%=readcount %></td>
		</tr>
		<% 
				}
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
	
	
	<%
	rs.close();
	stmt.close();
	conn.close();
		}
		
		if(lastRow > 0){
			int setPage = 1;
			int lastPage = 0;
			if(lastPage % listSize == 0)
				lastPage = lastRow / listSize;
		else
			lastPage = lastRow / listSize + 1;
			
			if(currentPage > 1){
				
	%>
			<a href="listboard.jsp?pageNum=<%=currentPage-1%>">[이전]</a>			
	<% 		
			}
		for(i=setPage; i<=lastPage; i++){
			if(i == Integer.parseInt(pageNum)){
	%>
		[<%=i%>]
	<%		
		}else{
	%>
		<a href="listboard.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	<%
		}
	}
	if(lastPage > currentPage) {
	%>
		<a href="listboard.jsp?pageNum=<%=currentPage+1%>">[다음]</a>
	<%
		}
	}
	%>  
	
	
	<TABLE border=0 width=600>
	<TR>
		<TD align='center'>	
			<TABLE border='0' >
			<FORM Name='Form' method="post" Action='listboard.jsp' onsubmit='return Check()'>
			<input type='hidden' name='search' value='1'>
			<TR>
				<TD align='right'>
				<select name='key' style="background-color:cccccc;">
				<option value='title' selected><font size='2'>
                                                        글제목</font></option>
				<option value='contents'><font size='2'>
                                                        글내용</font></option>
				<option value='name'><font size='2'>
                                                        작성자</font></option>
				</select>
				</TD>
				<TD align='left'>
					<input class="search" type='text' name='keyword' 
                                                   value='' size='20' maxlength='30'>
					<input  type='submit' value='검색'>
				</td>
			  </TR>
			  </FORM>
			  </TABLE> 
		</TD>

		<TD align='right'>		
		<a href='write.jsp'>[등록]</a>				
		</TD>
	</TR>
</TABLE>
                  
</BODY>                     
</HTML>