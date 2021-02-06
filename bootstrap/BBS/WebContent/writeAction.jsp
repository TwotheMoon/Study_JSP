<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="bbs.*"%>
    <%@ page import="java.io.*" %>
    <%request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<%
	
		String userID = null;
		if( session.getAttribute("userID") != null){	// 세션 존재했을때
			userID = (String)session.getAttribute("userID");	// 세션을 변수에 저장
		}
		if( userID == null){	// 세션이 없는경우
			
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('로그인후 작성해주세요.');"); // 오류 메세지
			script.print("location.href='login.jsp'");	// 전 페이지로 반환
			script.print("</script>");
		}
		else{	// 세션이 있는경우
		// 서버 저장				 
		// 파일 저장할 폴더 
		ServletContext context = getServletContext();
		String realFolder = context.getRealPath("upload");	 // 폴더 이름
		
		// 파일 서버에 저장
		MultipartRequest multi = new MultipartRequest(request , realFolder ,1024*1024*10 , "UTF-8" , new DefaultFileRenamePolicy());
		//	MultipartRequest multi = new MultipartRequest ( 요청방식, 저장위치 , 용량 , 인코딩 타입 , 보안방식);
	
		// DB
		String bbsTitle = multi.getParameter("bbsTitle");
		// 전 페이지의 form 이 multipart로 번경		
		String bbsContents = multi.getParameter("bbsContents");
		String bbsFile = multi.getFilesystemName("bbsFile");
						// 파일명 요청 : getFilesystemName
			
			
		BbsDAO bbsDAO = new BbsDAO();
		
		if(bbsTitle.equals(null) || bbsTitle.equals(null)){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('입력이 안된 사항이 있습니다');"); // 오류 메세지
			script.print("history.back()");	// 전 페이지로 반환
			script.print("</script>");
		}else{
			
		int result = bbsDAO.write(bbsTitle, bbsContents , userID , bbsFile);
		if( result == 1){	// 글 작성 성공
			
			
		PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("location.href ='bbs.jsp'");
			script.print("</script>");
		}
		if(result == -1){	// db오류
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('글 작성 실패');"); // 오류 메세지
			script.print("history.back()");	// 전 페이지로 반환
			script.print("</script>");
		}
		}
		
		
		}
	
	%>

</body>
</html>