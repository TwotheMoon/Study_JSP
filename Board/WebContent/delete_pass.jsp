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
		// 전페이지로 부터 게시물 번호 받기
		String num = request.getParameter("num");
	%>
	
	<center> <font size="3"> 비밀번호 확인  </font>
	
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
								비밀번호
							</td>
							<td>
								<input type="password" name="pass" size="12">
								<input type="submit" value="확인">
							</td>
						</tr>
					</table>
			</form>
	
	<table width="600" >
		<tr>
			<td> <hr size="1">
		</tr>
	</table>
	
	<a href="listboard.jsp">[목록보기]</a>


</body>
</html>