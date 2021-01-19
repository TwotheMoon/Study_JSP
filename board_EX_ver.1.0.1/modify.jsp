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
<title> 게시판 수정 </title>
<script language="javascript">
function Check() 
{
if(Modify.name.value.length < 1){
	alert("작성자를 입력하세요");
	Modify.name.focus();
	return false;
	}	
if(Modify.pass.value.length < 1){
	alert("비밀번호를 입력하세요.");
	Modify.pass.focus();
	return false;
}
if(Modify.email.value.indexOf("@") + "" == "-1" ||
   Modify.email.value.indexOf(".") + "" == "-1" ||
   Modify.email.value == "" )
{
	alert("E-mail을 입력하세요.");
	Modify.email.focus();
	return false;
}
if(Modify.title.value.length < 1){
	alert("글제목을 입력하세요.");
	Modify.title.focus();
	return false;
}
if(Modify.title.value.length < 1){
	alert("글내용을 입력하세요.")
	return false;
}
Modify.submit();
}

function list() {
	location.href = "listboard.jsp";
}
</script>
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
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	
	rs = pstmt.executeQuery();
	rs.next();
	
	String name = rs.getString("name");
	String email = rs.getString("email");
	String title = rs.getString("title");
	String contents = rs.getString("contents");
	String writedate = rs.getString("writedate");
	int readcount = rs.getInt("readcount");
%>

<center><b> 게시판 글 수정</b>

<table border="0" width="700">
	<tr>
		<td><hr size="1" noshade></td>
	</tr>
</table>
	
<form name="Modify" action="modify_output.jsp" method="get" onsubmit="return Check()">
<input type="hidden" name="num" value="<%=num%>">

<table border="0" width="600">
	<tr>
		<td bgcolor="#815854"><b>작성자</b></td>
		<td>
			<p><input type="text" size="12" name="name" value="<%=name%>"> * 필수<p/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#815854"><b>비밀번호</b></td>
		<td>
			<p><input type="password" size="12" name="pass" > * 필수<p/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#815854"><b>E-mail</b></td>
		<td>
			<input type="text" size="40" maxlength="50" name="email" value="<%=email%>">
		</td>
	</tr>
	<tr>
		<td><hr size="1" noshade></td>
	</tr>
	<tr>
		<td bgcolor="#815854"><b>글 제목</b></td>
		<td>
			<input type="text" size="70" maxlength="50" name="title" value="<%=title%>">
		</td>
	</tr>
	<tr>
		<td bgcolor="#815854"><b>글 내용</b></td>
		<td>
			<textarea rows="15" cols="70" wrap="virtual" name="contents"><%=contents %></textarea>
		</td>
	</tr>
	<tr>
		<td><hr size="1" noshade></td>
	</tr>
	<table>
		<tr>
			<td width="200" align="center">
				<input type="reset" value="디시 작성">
			</td>
			<td width="200" align="center">
				<input type="submit" value="수정완료">
			</td>
			<td width="200" align="center">
				<input type="button" value="목록" name="Page" onclick="list();">
			</td>
		</tr>
	</table>
</table>
</form>
	<% 
	}
	catch(SQLException e){
		out.print("SQL에러" + e.toString());
	}
	catch(Exception ex){
		out.print("JSP에러" + ex.toString());
	}
	finally{
		rs.close();
		pstmt.close();
		conn.close();
	}
	%>
	

</body>
</html>