<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	form , h3{
		width : 500px;
		margin: 0px auto;
	}
	button{
		padding: 27px;
		margin-left: 3px;
	}
	input {
		width: 150px;
		height: 30px;
 	}
	.col1{
		width: 100px;
	}
</style>
</head>
<body>
<%@include file="9_CSS_menu.jsp" %>
	<h3> �α��� ��</h3>
	<form>
		<table>
			<tr>
				<td class="col1"> ���̵� </td>
				<td> <input type="text"> </td>
				<td rowspan="2"><button>�α���</button> </td>
			</tr>
			<tr>
				<td> ��й�ȣ </td>
				<td> <input type="password"> </td>
			</tr>
		</table>	
	</form>
</body>
</html>