<%@page import="USER.UserDAO"%>
<%@page import="USER.User"%>
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
<title>회원탈퇴</title>
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
			script.print("alert('로그인 해주세요.');"); // 오류 메세지
			script.print("location.href='login.jsp'");	// 전 페이지로 반환
			script.print("</script>");
		}
		
		
			// 세션이 있는경우 삭제 실행
		UserDAO userDAO = new UserDAO();
			
			int result = userDAO.deleteUser(userID);
			
			if( result == 1){	// 유저 정보 삭제
				PrintWriter script = response.getWriter();
					script.print("<script>");
					script.print("location.href = 'login.jsp'");
					script.print("</script>");
			}
			if( result == -1){	// 유저 정보 실패
				PrintWriter script = response.getWriter();
					script.print("<script>");
					script.print("alert('회원탈퇴 실패')");
					script.print("history.back()");
					script.print("</script>");
			}
			

	%>
</body>
</html>