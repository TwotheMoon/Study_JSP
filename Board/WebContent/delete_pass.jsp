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
		// ���������� ���� �Խù� ��ȣ �ޱ�
		String num = request.getParameter("num");
	%>
	
	<center> <font size="3"> ��й�ȣ Ȯ��  </font>
	
		<table width="600" >
			<tr>
				<td> <hr size="1">
			</tr>
		</table>
		
			<form method="post" action="delete_input.jsp">
			
					<input type="hidden" name="num" value="<%=num%>">
			
					<table width="300">
						<tr>
							<td align="center" >
								��й�ȣ
							</td>
							<td>
								<input type="password" name="pass" size="12">
								<input type="submit" value="Ȯ��">
							</td>
						</tr>
					</table>
			</form>
	
	<table width="600" >
		<tr>
			<td> <hr size="1">
		</tr>
	</table>
	
	<a href="listboard.jsp">[��Ϻ���]</a>


</body>
</html>