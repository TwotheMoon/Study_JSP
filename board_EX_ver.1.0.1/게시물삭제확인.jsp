<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


	<%
		String num = request.getParameter("num");
	%>
	
	<center><font size="3">비밀번호 확인</font>
	
	<table width="600">
		<tr>
			<td><hr size="1"></td>
		</tr>
	</table>
	
	<form action="게시물삭제.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	<table width="300">
		<tr>
			<td align="center">
				<font size="2">비밀번호</font>
			</td>
			<td>
				<input type="password" name="pass" size="20" maxlength="20">
				<input type="submit" value="확인">
			</td>
		</tr>
	</table>
	<table width="600">
		<tr>
			<td><hr size="1"></td>
		</tr>
	</table>
		<center><a href="게시판목록.jsp">목록보기</a> </center>
	</form>
	