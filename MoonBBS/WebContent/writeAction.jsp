<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="bbsData.*"%>
    <%@ page import="java.io.*" %>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>Write Action</title>
</head>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null ){
			userID = (String)session.getAttribute("userID");
		}
		
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('로그인 후 작성해주세요.');");
			script.print("location.href='login.jsp'");
			script.print("</script>");
		}
		else{
			ServletContext context = getServletContext();
			String realFolder = context.getRealPath("upload");
			
			MultipartRequest multi = new MultipartRequest(request , realFolder , 1024*1024*10 , "UTF-8" , new DefaultFileRenamePolicy());
			
			String bbsTitle = multi.getParameter("bbsTitle");
			String bbsContents = multi.getParameter("bbsContents");
			String bbsFile = multi.getFilesystemName("bbsfile");
			
			BbsDAO bbsDAO = new BbsDAO();
			
			if(bbsTitle.equals(null) || bbsContents.equals(null)){
				PrintWriter script = response.getWriter();
				script.print("<script>");
				script.print("alert('입력되지 않은 사항이 있습니다.');");
				script.print("history.back()");
				script.print("</script>");
			}
			else{
				
				int result = bbsDAO.write(bbsTitle, bbsContents, userID, bbsFile);
				
				if(result == 1){
					PrintWriter script = response.getWriter();
					script.print("<script>");
					script.print("location.href='board.jsp'");
					script.print("</script>");
				}
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.print("<script>");
					script.print("alert('글 작성 실패');");
					script.print("history.back()");
					script.print("</script>");
				}
			}
		}
	%>
</body>
</html>