<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 게시판 </title>

<%

	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6 ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
	
	String strSQL = "select pass from tbboard where num = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();{
		String rspass = rs.getString("pass");
		if(pass.equals(rspass)){
		%>
				<jsp:forward page="게시물수정.jsp"></jsp:forward>
		<%
		}
		else{
			%>
				<jsp:forward page="게시물수정확인.jsp"></jsp:forward>
			<%
		}
	}
%>

<script language="javascript">
	
	function Check(){
		
		if(write.name.value.length < 1){
			alert("작성자 입력해주세요 ");
			write.name.focus();
				return false;
		}
		if(write.pass.value.length < 1){
			alert("비밀번호 입력해주세요");
			write.pass.focus();
				return false;
		}
		if(write.email.value.indexOf("@") + "" == "-1" || 
		   write.email.value.indexOf(".") + "" == "-1" ||
		   write.email.value == "")){
			alert("이메일 입력하세요");
			write.email.focus();
				return false;
		}
		if(write.title.value.length < 1){
			alert("글 제목 입력해주세요");
			write.title.focus();
				return false;
		}	
		if(write.contents.value.length < 1){
			alert("글 내용 입력해주세요");
			write.contents.focus();
				return false;
		}
		write.submit();
	}
</script>

</head>
<body>
	
	<center><font size="3">게시물 수정</font></center>
	
	<center><table border="0" width="600" >
		<tr>
			<td><hr size="1" noshade></td>
		</tr>
	</table></center>

	<form name="write" action="게시물수정.jsp" method="post" onsubmit="return Check()">
	<center><table border="0" width="600" cellpadding="2" cellspacing="1">
			<tr>
				<td width="100" bgcolor="cccccc">
					<font size="2"><center>작성자</center> </font>
				</td>
				<td>
					<input type="text" size="12" name="name"> *필수
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="cccccc">
					<font size="2"><center>비밀번호</center> </font>
				</td>
				<td>
					<input type="password" size="12" name="pass"> *필수 (게시물 수정 및 삭제시 필요.)
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="cccccc">
					<font size="2"><center>이메일</center> </font>
				</td>
				<td>
					<input type="text" size="40" maxlength="50" name="email">
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="cccccc">
					<font size="2"><center>글 제목</center> </font>
				</td>
				<td>
					<input type="text" size="70" maxlength="50" name="title">
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="cccccc">
					<font size="2"><center>글 내용</center> </font>
				</td>
				<td>
					<textarea cols="70" rows="15" size="70" name="contents" warp="virtual"></textarea>
				</td>
			</tr>
			<table></center>
				<tr>
					<td width="100" align="center">
				 		<input type="reset" value="다시작성">
					</td>
					<td width="400" align="center">
				 		<input type="submit" value="등록"> 
					</td>
				</tr>
			</table>
		</table>
	</form>
</body>
</html>