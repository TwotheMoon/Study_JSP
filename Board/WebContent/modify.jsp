<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


	<%// wite.jsp �ڵ� ���� %>
<SCRIPT language="JavaScript">
function Check()
{
	
	if (Write.name.value.length < 1) {
		alert("�ۼ��ڸ� �Է��ϼ���.");
		Write.name.focus(); 
	        return false;
		}

	if (Write.pass.value.length < 1) {
		alert("��й�ȣ�� �Է��ϼ���.");
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
	
	<% //�ڹٽ�ũ��Ʈ ���� �޼ҵ� ���� [ ��ũ : �Խù���� ] %>
	function list() {
		location.href = "listboard.jsp";
	}
</SCRIPT>
</head>
<body>



<center><font size='3'><b> �Խ��� �ۼ��� </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade>
				</TD>
		 	</TR>
		</TABLE>
		
	
	<%
		// ������ �Խù� ��ȣ ȣ�� 
		String num = request.getParameter("num");
		 
		// db ���� 
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6?serverTimezone=UTC&useSSL=false","root","1234");
		
		// SQL�ۼ� : �Խù���ȣ�� �ش��ϴ� �ʵ� ȣ��
		String strSQL = "SELECT * From tbboard where num=? ";
		
		// SQL����
		PreparedStatement pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt( num ));
		
		// SQL ���
		ResultSet rs = pstmt.executeQuery();
		
		// SQL ��� ȣ�� 
		rs.next();
		
		// ��� ����� �ʵ� ȣ�� 
		String name = rs.getString("name");
		String email = rs.getString("email");
		String title = rs.getString("title");
		String contents = rs.getString("contents");
		String writedate = rs.getString("writedate");
		String readcount = rs.getString("readcount");
		

	%>
		
		
<FORM Name='Write' Action='modity_output.jsp' Method='post' OnSubmit='return Check()'>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>

	
	<input type="hidden" name="num" value="<%=num%>">


	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>�ۼ���</b></center></font> 
		</TD>
		<TD>
			<p><input type='text' size='12' name='name' value="<%=name %>" > * �ʼ�</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>��й�ȣ</b></center></font>
		</TD>
		<TD>
			<p><input type='password' size='12' name='pass'> * �ʼ� (�Խù� ���� ������ �ʿ��մϴ�.)</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>E-mail</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='40' maxlength='50' name='email' value="<%=email%>"></font>
		</TD>
	</TR>
	
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>�� ����</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='70' maxlength='50' name='title' value="<%=title%>"></font>
		</TD>
	</TR>

	<TR>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>�� ����</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<textarea cols='70' rows='15' wrap='virtual' name='contents'><%=contents %></textarea>
         		</font>
      	</TD>
	</TR>

	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD width='200' align='center'>
					<input Type = "Reset" Value = '�ٽ� �ۼ�'>
				</TD>
				<TD width='200' align='center'>
					<input Type = "submit" Value = '�����Ϸ�'>
				</TD>
				
				<TD width='200' align='center'>
					<input Type = "button" Value="���" name="page" onclick="list();">
				</TD>
				
			</TR>
		</TABLE>
		</TD>
	</TR>
   
   
</TABLE>
</FORM>
	
	

</body>
</html>