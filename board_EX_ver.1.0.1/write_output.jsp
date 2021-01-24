
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%request.setCharacterEncoding("euc-kr"); %>
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
	a{
		text-decoration: none;	/* ��ũ ���� ���� */
		color: tomato;
	}
	
</style>

<meta charset="EUC-KR">
<title> �Խ��� </title>
</head>
<body>

	<%!
		// \n \r  -> <br> �Խ��� �� �޼ҵ� Ȱ���ؼ� �ٹٲ� ����
		public String Change(String parament){
			
			if( parament !=null && parament !=""){
				parament = parament.replace("\r\n" , "<br>");
			}
			return parament;
		}
	%>

	<%
		String num = request.getParameter("num");
	
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard?serverTimezone=UTC&useSSL=false","root","1234");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
		String strSQL = "SELECT * FROM tableboard WHERE num = ?";
		pstmt = conn. prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(num));
		
		rs = pstmt.executeQuery();
		rs.next();
		
		String name = rs.getString("name");
		String title = rs.getString("title");
		String contents = rs.getString("contents").trim();
		String writedate = rs.getString("writedate");
		int readcount = rs.getInt("readcount");
		String filename = rs.getString("filename");
	%>
	
	<center><b>�Խ���</b>
	
	<table border="0" width="700">
		<tr>
			<td width="100" bgcolor="#815854"> �ۼ��� : <%=name %> </td>
			<td bgcolor="#815854">�ۼ���: <%=writedate %>, ��ȸ��: <%=readcount %>"  </td>
		</tr>
		
		<tr>
			<td> ÷������ : <a href="file_down.jsp?num=<%=num%>"><%=filename %></a> </td>
		</tr>
	</table>
	
	<table border="0" width="700">
		<tr>
			<td bgcolor="#815854">
				<b><%=title %></b>
			</td>
		</tr>
	</table>

	<table border="0" width="700" style="word-break:break-all">
		<tr>
			<td bgcolor="#815854"><%=Change(contents) %></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td bgcolor="#815854"></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td>
				<hr size="1" noshade>
			</td>
		</tr>
	</table>
	
	<table border="0" width="700">
		<tr>
			<td align="left">
				<a href="modify_pass.jsp?num=<%=num %>">[�����ϱ�]</a>
				<a href="delete_pass.jsp?num=<%=num %>">[�����ϱ�]</a>
			</td>
			<td align="right">
				<a href="reply.jsp?num=<%=num %>">[�亯�ޱ�]</a>
				<a href="write.jsp">[�۾���]</a>
				<a href="listboard.jsp">[��Ϻ���]</a>
			</td>
		</tr>
	</table>

<%
	strSQL = "UPDATE tableboard SET readcount=readcount+1 WHERE num = ?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate();
		}
		catch(SQLException e){
			out.print("SQL����" + e.toString());
		}
		catch(Exception ex){
			out.print("jsp����" + ex.toString());
		}

%>
<script language="javascript">
	function check() {
		if(plus.plus_name.value.length < 1){
			alert("�ۼ��� �Է����ּ���.");
			plus.plus_name.focus();
			return false;
		}
		if(plus.plus-contents.value.length < 1){
			alert("��� ������ �Է����ּ���");
			plus.plus_contents.focus();
			return false;
		}

	}
</script>
<p>
<p>

<form name="plus" action="plus_input.jsp" method="post" onsubmit="return check()">
	<input type="hidden" name="num" value="<%=num%>">
	<table width="700">
		<tr>
			<td width="200"> �ۼ���</td>
			<td> <input type="text" name="plus_name" size="12" maxlength="5"> </td>
		</tr>
		<tr>
			<td>���</td>
			<td><input type="text" name="plus_contents" size="60"></td>
			<td><input type="submit" value="��۵��"></td>
		</tr>
	</table>
</form>

<p>
<p>

	<%
		String strSQL = "SELECT * FROM plus where id = " + num;
		
		pstmt = conn.prepareStatement(strSQL);
		rs = pstmt.executeQuery();
		
		while ( rs.next() ){
	%>
	<table width="700">
		<tr>
			<td align="left" width="100"> <%=rs.getString("name") %> </td>
			<td align="left" width="300"> <%=rs.getString("contents") %> </td>
			<td align="right"> <%=rs.getString("writedate") %> </td>
		</tr>
	</table>
	
	<% 
		}
			rs.close();
			pstmt.close();
			conn.close();
				
	%>
</body>
</html>