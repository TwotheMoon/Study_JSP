<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


	<%
		String num = request.getParameter("num");
	%>
	
	<center><font size="3">��й�ȣ Ȯ��</font>
	
	<table width="600">
		<tr>
			<td><hr size="1"></td>
		</tr>
	</table>
	
	<form action="�Խù�����.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	<table width="300">
		<tr>
			<td align="center">
				<font size="2">��й�ȣ</font>
			</td>
			<td>
				<input type="password" name="pass" size="20" maxlength="20">
				<input type="submit" value="Ȯ��">
			</td>
		</tr>
	</table>
	<table width="600">
		<tr>
			<td><hr size="1"></td>
		</tr>
	</table>
		<center><a href="�Խ��Ǹ��.jsp">��Ϻ���</a> </center>
	</form>
	