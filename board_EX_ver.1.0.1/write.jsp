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
<title> �Խ��� �ۼ� </title>

<script language="javascript">
	function Check() {
		if(Write.name.value.length < 1){
			alert("�ۼ��ڸ� �Է��ϼ���.");
			Write.name.focus();
			return false;
		}
		if(Write.pass.value.length < 1){
			alert("��й�ȣ�� �Է��ϼ���");
			Write.pass.focus();
			return false;
		}
		if (Write.email.value.indexOf("@") + "" == "-1" ||
			Write.email.value.indexOf(".") + "" == "-1" ||
			Write.email.value == "" )
			{ 
				alert("E-mail�� �Է��ϼ���.");
				Write.email.focus();
				return false;
			}

		if (Write.title.value.length < 1) {
			alert("�������� �Է��ϼ���.");
			Write.write_title.focus(); 
			return false;
		      }

		if (Write.contents.value.length < 1) {
			alert("�۳����� �Է��ϼ���.");
			Write.content.focus(); 
			return false;
			  }
		Write.submit();
	}

</script>
</head>
<body id="main-column">

	<b> �Խ��� �۾��� </b>
	<table>
		<tr>
			<td>
				<hr size="1" noshade>
			</td>
		</tr>
	</table>

<form name="Write" action="write_input.jsp" method="post" onsubmit="return Check()" enctype="multipart/form-data">

	<table border="0" width="700">
		<tr>
			<td width="100" bgcolor="#815854"> �ۼ��� </td>
			<td> <input type="text" size="12" name="name"> * �ʼ� </td>
		</tr>
		<tr>
			<td width="100" bgcolor="#815854"> ��й�ȣ </td>
			<td> <input type="password" size="12" name="pass"> * �ʼ� (�Խù� ���� ������ �ʿ��մϴ�.) </td>
		</tr>
		<tr>
			<td width="100" bgcolor="#815854"> E-mail </td>
			<td> <input type="text" size="40" maxlength="50" name="email"></td>
		</tr>
		<tr>
			<td width="100" bgcolor="#815854"> ÷������ </td>
			<td><input type="file" name="userFile"> </td>
		</tr>
		<tr>
			<td colspan="2"><hr size="1" noshade></td>
		</tr>
		<tr>
			<td width="100" bgcolor="#815854"> �� ���� </td>
			<td> <input type="text" size="70" maxlength="50" name="title"></td>
		</tr>
		<tr>
			<td width="100" bgcolor="#815854"> �� ���� </td>
			<td> <textarea rows="15" cols="70" wrap="virtual" name="contents"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2"><hr size="1" noshade></td>
		</tr>
	</table>
	<table>
		<tr>
			<td width="100" align="center">
				<input type="reset" value="�ٽ��ۼ�">
			</td>
			<td width="200" align="center">
				<input type="submit" value="���">
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>