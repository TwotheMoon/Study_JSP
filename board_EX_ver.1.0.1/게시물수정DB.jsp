<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> �Խ��� </title>

<%

	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6 ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
	
	String strSQL = "select pass from tbboard where num = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();{
		String rspass = rs.getString("pass");
		if(pass.equals(rspass)){
		%>
				<jsp:forward page="�Խù�����.jsp"></jsp:forward>
		<%
		}
		else{
			%>
				<jsp:forward page="�Խù�����Ȯ��.jsp"></jsp:forward>
			<%
		}
	}
%>

<script language="javascript">
	
	function Check(){
		
		if(write.name.value.length < 1){
			alert("�ۼ��� �Է����ּ��� ");
			write.name.focus();
				return false;
		}
		if(write.pass.value.length < 1){
			alert("��й�ȣ �Է����ּ���");
			write.pass.focus();
				return false;
		}
		if(write.email.value.indexOf("@") + "" == "-1" || 
		   write.email.value.indexOf(".") + "" == "-1" ||
		   write.email.value == "")){
			alert("�̸��� �Է��ϼ���");
			write.email.focus();
				return false;
		}
		if(write.title.value.length < 1){
			alert("�� ���� �Է����ּ���");
			write.title.focus();
				return false;
		}	
		if(write.contents.value.length < 1){
			alert("�� ���� �Է����ּ���");
			write.contents.focus();
				return false;
		}
		write.submit();
	}
</script>

</head>
<body>
	
	<center><font size="3">�Խù� ����</font></center>
	
	<center><table border="0" width="600" >
		<tr>
			<td><hr size="1" noshade></td>
		</tr>
	</table></center>

	<form name="write" action="�Խù�����.jsp" method="post" onsubmit="return Check()">
	<center><table border="0" width="600" cellpadding="2" cellspacing="1">
			<tr>
				<td width="100" bgcolor="cccccc">
					<font size="2"><center>�ۼ���</center> </font>
				</td>
				<td>
					<input type="text" size="12" name="name"> *�ʼ�
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="cccccc">
					<font size="2"><center>��й�ȣ</center> </font>
				</td>
				<td>
					<input type="password" size="12" name="pass"> *�ʼ� (�Խù� ���� �� ������ �ʿ�.)
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="cccccc">
					<font size="2"><center>�̸���</center> </font>
				</td>
				<td>
					<input type="text" size="40" maxlength="50" name="email">
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="cccccc">
					<font size="2"><center>�� ����</center> </font>
				</td>
				<td>
					<input type="text" size="70" maxlength="50" name="title">
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="cccccc">
					<font size="2"><center>�� ����</center> </font>
				</td>
				<td>
					<textarea cols="70" rows="15" size="70" name="contents" warp="virtual"></textarea>
				</td>
			</tr>
			<table></center>
				<tr>
					<td width="100" align="center">
				 		<input type="reset" value="�ٽ��ۼ�">
					</td>
					<td width="400" align="center">
				 		<input type="submit" value="���"> 
					</td>
				</tr>
			</table>
		</table>
	</form>
</body>
</html>