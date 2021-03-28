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
	table{
		border-top: solid 1px #eeeeee;
		border-bottom: solid 1px #eeeeee;
		padding: 10px 0px;
		margin-bottom: 20px;
		width: 600px;
		height: 350px;
	}
	td{
		display: inline-block;
	}
	.filed-name{
		width: 130px;
		margin-left: 20px;
	}
	.buttons{
		width: 400px;
		text-align: right;
	}
	.email-box{
		width: 80px;
	}
	textarea {
	width: 250px;
	height: 100px;
	}
	.hello{
		vertical-align: top;	
	}
	.buttons input{
		padding: 10px 20px;
	}

</style>
</head>
<body>
<%@include file="9_CSS_menu.jsp" %>
	<h3> ȸ������ �� </h3>
<form>	
	<table>
		<tr>
			<td class="filed-name"> ���̵� </td>
			<td> <input type="text"> </td>
		</tr>
		<tr>
			<td class="filed-name"> ��й�ȣ </td>
			<td> <input type="password"> </td>
		</tr>
		<tr>
			<td class="filed-name"> ��й�ȣ Ȯ�� </td>
			<td> <input type="password"> </td>
		</tr>
		<tr>
			<td class="filed-name"> �̸� </td>
			<td> <input type="text"> </td>
		</tr>
		<tr>
			<td class="filed-name"> �̸��� </td>
			<td> <input class="email-box" type="text">@
				<select>
					<option>���� �Է�</option>
					<option>naver.com</option>
					<option>gmail.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="filed-name"> �̸��� ���� </td>
			<td> <input type="radio" name="email" checked="checked" >�����</td>
			<td> <input type="radio" name="email">����</td>
		</tr>
		<tr>
			<td class="filed-name"> ���� ��� </td>
			<td> <input type="checkbox" name="route1"> ģ����õ </td>
			<td> <input type="checkbox" name="route1"> ���ͳݰ˻� </td>
			<td> <input type="checkbox" name="route1" checked="checked"> ��Ÿ </td>
		</tr>
		<tr>
			<td class="filed-name hello">�λ縻</td>
			<td><textarea></textarea> </td>
		</tr>
	</table>
	<div class="buttons">
		<input type="submit" value="�����ϱ�">
		<input type="reset" value="����ϱ�">
	</div>
</form>
</body>
</html>