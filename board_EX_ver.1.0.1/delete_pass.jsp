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
<title> 게시판 삭제 </title>
</head>
<body>
<%String num = request.getParameter("num"); %>

<center><b>비밀번호 확인</b>

<table border="0" width="700">
	<tr>
		<td>
			<hr size="1" noshade>
		</td>
	</tr>
</table>

<form action="delete_input.jsp" method="post">	
<input type="hidden" name="num" value="<%=num%>">
	<table border="0" width="400">
		<tr>
			<td>
				<b>비밀번호</b>
			</td>
			<td>
				<input type="password" name="pass" size="20" maxlength="20">
				<input type="submit" value="확인">
			</td>
		</tr>		
	</table>
	
	<table border="0" width="700">
		<tr>
			<hr size="1" noshade>
		</tr>
	</table>
	
	<a href="listboard.jsp">[목록 보기]</a>
</form>


</body>
</html>