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

<center><b>회원가입</b>

	<form method="post" action="login.jsp">

		<table>
		<tr>
			<td><b>아이디</b></td>
			<td><input type="text" name="id" placeholder="아이디"></td>
		</tr>
		<tr>
			<td><b>비밀번호</b></td>
			<td><input type="password" name="pass" placeholder="비밀번호"></td>
		</tr>
		<tr>
			<td><b>이메일</b></td>
			<td><input type="text" name="email" placeholder="이메일"> </td>
		</tr>
	</table>
	<table>
		<tr>
			<td>
				<input type="reset" value="다시 입력">
				<input type="submit" value="가입하기">
			</td>
		</tr>
	</table>
	</form>

</body>
</html>