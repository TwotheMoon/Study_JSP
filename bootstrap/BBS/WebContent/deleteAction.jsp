<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="bbs.*"%>
    <%@ page import="java.io.*" %>
    <%request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="Bbs" class="bbs.Bbs"></jsp:useBean>
    <jsp:setProperty property="bbsTitle" name="Bbs"/>
    <jsp:setProperty property="bbsContents" name="Bbs"/>
    
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
		
		int bbsID = 0;
		
		if(request.getParameter("bbsID") !=null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
			// 세션이 있는경우
		BbsDAO bbsDao = new BbsDAO();
			
			int result = bbsDao.delete(bbsID);

			if(result == 1){	// 업데이트 성공
			PrintWriter script = response.getWriter();
				script.print("<script>");
				script.print("location.href ='bbs.jsp'");
				script.print("</script>");
			}
			if(result == -1){	// 업데이트 실패
				PrintWriter script = response.getWriter();
				script.print("<script>");
				script.print("alert('글 삭제 실패');"); // 오류 메세지
				script.print("history.back()");	// 전 페이지로 반환
				script.print("</script>");
				}
				

	%>
</body>
</html>