<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
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
</head>
<body>

	<%

	
	int num = Integer.parseInt(request.getParameter("num"));
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspboard?serverTimezone=UTC&useSSL=false","root","1234");
	
	// 2. SQL 작성 : 해당 게시물 번호의 첨부파일 이름 검색
	String strSQL = "select filename from tableboard where num = "+num;
	
	PreparedStatement pstmt = conn.prepareStatement(strSQL);
	
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	
	String filename = rs.getString("filename");
	String filename2 = new String(filename.getBytes("KSC5601") , "8859_1"); // 파일이름 바이트형 변환
	
	File file = new File("C:/Users/2theMoon/eclipse-jsp/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/jsp6/filestorge/" + filename);
						// DB에 저장된 파일 클래스화
	byte by[] = new byte[ (int)file.length()]; // 파일용량 [코드의 길이]
	
	response.setHeader("Content-Disposition" , "attachment;filename=" +filename2+";");	// 한글파일 인코딩
	
	if(file.isFile() ){ // 파일이 존재하면
		BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));		// 입력 스트림
		BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());	// 출력 스트림
		
		int read = 0;
		
		while( ( read = fin.read(by) ) != -1){
			outs.write(by , 0 , read);
		}
		
	}
	
	%>

</body>
</html>