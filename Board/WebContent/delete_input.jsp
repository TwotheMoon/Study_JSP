<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%	// 삭제할 게시물 번호 / 전 페이지에서 입력받은 비밀번호
		
		String num = request.getParameter("num");
		String pass = request.getParameter("pass");
		

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp6 ?serverTimezone=UTC&useSSL=false" , "root" , "1234");
		
		// 삭제할 게시물번호의 패스워드 검색
		String strSQL = "select pass from tbboard where num =?";
		PreparedStatement pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(num));
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		if(pass.equals(rs.getString("pass"))){
			
			strSQL = "DELETE from tbboard where num =? ";
			
			pstmt = conn.prepareStatement(strSQL);
			pstmt.setInt(1, Integer.parseInt(num));
			
			pstmt.executeUpdate();
			
			// 삭제후 뒷번호 들은 -1씩 감소
			strSQL = "update tbboard set num = num-1 where num > ?";
			pstmt = conn.prepareStatement(strSQL);
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.executeUpdate();
			
			response.sendRedirect("listboard.jsp");
		}
		else{
			response.sendRedirect("delete_pass.jsp?num="+num);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
	%>

</body>
</html>