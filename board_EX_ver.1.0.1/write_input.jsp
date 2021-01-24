<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	String realFolder = "";							// [절대경로] 실제경로
 	String saveFolder = "filestorge";				// 업로드 할 경우 저장되는 폴더명
 	String enctype = "euc-kr";
 	
 	int sizeLimit = 1024 * 1024 * 10; 				// 10MB // 업로드 파일 용량 제한
 	// 서블릿 클래스
 	ServletContext context = getServletContext();	
 	realFolder = context.getRealPath(saveFolder);	// 폴더의 실제경로 구하기	
 	
 	MultipartRequest multi = 
 			new MultipartRequest(request , realFolder , sizeLimit , enctype , new DefaultFileRenamePolicy() );
 							  // 요청방식     저장경로       용량제한      인코딩타입        보안방식 
 	String filename = multi.getFilesystemName("userFile");	// DB에 저장되는 파일명	
 	File file = multi.getFile("userFile");	// 실제 파일
 
 request.setCharacterEncoding("euc-kr"); %>
 
	<%
	
	String name = multi.getParameter("name");
	String pass	= multi.getParameter("pass");
	String email = multi.getParameter("email");
	String title = multi.getParameter("title");
	String contents = multi.getParameter("contents");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard?serverTimezone=UTC&useSSL=false","root","1234");
	
	PreparedStatement pstmt1 = null, pstmt2 = null;
	
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
	indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
	
	String strSQL = "SELECT Max(num) FROM tableboard";
	pstmt1 = conn.prepareStatement(strSQL);
	ResultSet rs = pstmt1.executeQuery();
	int num = 1;
	
	rs.next();
	num = rs.getInt(1) + 1;
	
	strSQL = "INSERT INTO tableboard(num, name, pass, email, title, contents, writedate, readcount, filename)";
	strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt2 = conn.prepareStatement(strSQL);
	pstmt2.setInt(1, num);
	pstmt2.setString(2, name);
	pstmt2.setString(3, pass);
	pstmt2.setString(4, email);
	pstmt2.setString(5, title);
	pstmt2.setString(6, contents);
	pstmt2.setString(7, indate);
	pstmt2.setInt(8, 0);
	pstmt2.setString(9, filename);
	pstmt2.executeUpdate();
	
	rs.close();
	pstmt1.close();
	pstmt2.close();
	conn.close();
	
	response.sendRedirect("listboard.jsp");
	
	%>
