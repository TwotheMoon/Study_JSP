<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<title>Insert title here</title>
</head>
<body>

<center><b>ȸ������</b>

	<form method="post" action="login.jsp">

		<table>
		<tr>
			<td><b>���̵�</b></td>
			<td><input type="text" name="id" placeholder="���̵�"></td>
		</tr>
		<tr>
			<td><b>��й�ȣ</b></td>
			<td><input type="password" name="pass" placeholder="��й�ȣ"></td>
		</tr>
		<tr>
			<td><b>�̸���</b></td>
			<td><input type="text" name="email" placeholder="�̸���"> </td>
		</tr>
	</table>
	<table>
		<tr>
			<td>
				<input type="reset" value="�ٽ� �Է�">
				<input type="submit" value="�����ϱ�">
			</td>
		</tr>
	</table>
	</form>

</body>
</html>