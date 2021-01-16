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


	<%// wite.jsp 코드 복사 %>
<SCRIPT language="JavaScript">
function Check()
{
	
	if (Write.name.value.length < 1) {
		alert("작성자를 입력하세요.");
		Write.name.focus(); 
	        return false;
		}

	if (Write.pass.value.length < 1) {
		alert("비밀번호를 입력하세요.");
		Write.pass.focus(); 
		return false;
		}

	if (Write.email.value.indexOf("@") + "" == "-1" ||
		Write.email.value.indexOf(".") + "" == "-1" ||
		Write.email.value == "" )
		{ 
			alert("E-mail을 입력하세요.");
			Write.email.focus();
			return false;
		}

	if (Write.title.value.length < 1) {
		alert("글제목을 입력하세요.");
		Write.write_title.focus(); 
		return false;
	        }

	if (Write.contents.value.length < 1) {
		alert("글내용을 입력하세요.");
		Write.content.focus(); 
		return false;
	        }

	Write.submit();
	
}
	
	<% //자바스크립트 에서 메소드 정의 [ 링크 : 게시물목록 ] %>
	function list() {
		location.href = "listboard.jsp";
	}
</SCRIPT>
</head>
<body>



<center><font size='3'><b> 게시판 글수정 </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade>
				</TD>
		 	</TR>
		</TABLE>
		
	
	<%
		// 수정할 게시물 번호 호출 
		String num = request.getParameter("num");
		 
		// db 연동 
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6?serverTimezone=UTC&useSSL=false","root","1234");
		
		// SQL작성 : 게시물번호에 해당하는 필드 호출
		String strSQL = "SELECT * From tbboard where num=? ";
		
		// SQL실행
		PreparedStatement pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt( num ));
		
		// SQL 결과
		ResultSet rs = pstmt.executeQuery();
		
		// SQL 결과 호출 
		rs.next();
		
		// 결과 결과의 필드 호출 
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
			<font size='2'><center><b>작성자</b></center></font> 
		</TD>
		<TD>
			<p><input type='text' size='12' name='name' value="<%=name %>" > * 필수</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>비밀번호</b></center></font>
		</TD>
		<TD>
			<p><input type='password' size='12' name='pass'> * 필수 (게시물 수정 삭제시 필요합니다.)</p>
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
			<font size='2'><center><b>글 제목</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='70' maxlength='50' name='title' value="<%=title%>"></font>
		</TD>
	</TR>

	<TR>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>글 내용</b></center></font>
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
					<input Type = "Reset" Value = '다시 작성'>
				</TD>
				<TD width='200' align='center'>
					<input Type = "submit" Value = '수정완료'>
				</TD>
				
				<TD width='200' align='center'>
					<input Type = "button" Value="목록" name="page" onclick="list();">
				</TD>
				
			</TR>
		</TABLE>
		</TD>
	</TR>
   
   
</TABLE>
</FORM>
	
	

</body>
</html>