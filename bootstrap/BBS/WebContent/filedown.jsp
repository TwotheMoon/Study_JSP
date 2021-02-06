<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.nio.Buffer"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		// 파일 이름 요청
		String filename = request.getParameter("bbsFile");
			// 파일 이름 바이트로 변경
			String filename2 = new String(filename.getBytes("UTF-8" ));
													// 유니코드 : 전세계 공용어
		
		// 해당 파일을 자바로 가져오기
		File file = new File("C:/Users/2theMoon/eclipse-jsp/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BBS/upload"+filename);
		
		// 파일 다운로드 창 요청
		response.setHeader("Content-Disposition", "attachment;filename="+filename2+";");
		
		// 배열 저장 [ 입출력 스트림 교환]
		byte[] b = new byte[ (int)file.length()];
		
		if(file.isFile()){	// 파일이 존재하면
			
			// 입력 스트림
			BufferedInputStream fin = new BufferedInputStream( new FileInputStream(file));
		
			// 출력 스트림
			BufferedOutputStream fout = new BufferedOutputStream( response.getOutputStream());
		
			int count; // 바이트 단위 수 체크 [바이트 단위로 읽어오는 수]
			
			while( (count= fin.read(b)) != -1){	// 입력 스트림 바이트 읽고 배열에 저장
												// -1 이면 읽어올게 없음		
				fout.write(b , 0 , count);
			}
			fout.close();	// 출력 스트림 종료
			fin.close();	// 입력 스트림 종료
		}
	%>

</body>
</html>