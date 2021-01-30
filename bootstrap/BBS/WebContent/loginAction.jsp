<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="USER.*" %>
    <%@ page import="java.io.*" %>
    
    <jsp:useBean id="user" class="USER.User"></jsp:useBean>
    <jsp:setProperty property="userID" name="user"/>
    <jsp:setProperty property="userPassword" name="user"/>
    
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
		if( userID != null){	// 세션이 있을경우
			
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('이미 로그인이 되어있습니다.');"); // 오류 메세지
			script.print("location.href='main.jsp'");	// 전 페이지로 반환
			script.print("</script>");
		}
	
	%>

	<%
	
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID() , user.getUserPassword());
		
		if( result == 1){	// 로그인 성공
			
			session.setAttribute("userID" , user.getUserID()); // 아이디 세션에 저장
			
		PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("location.href ='main.jsp'");
			script.print("</script>");
		}
		if(result == 0){	// 비밀번호 틀림
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('비밀번호가 다릅니다.');"); // 오류 메세지
			script.print("history.back()");	// 전 페이지로 반환
			script.print("</script>");
		}
		if(result == -1){	// 아이디 정보가 없음
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('아이디가 없습니다.');"); // 오류 메세지
			script.print("history.back()");	// 전 페이지로 반환
			script.print("</script>");
		}
		if(result == -2){	// db 오류
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('데이터베이스 접근 오류.');"); // 오류 메세지
			script.print("history.back()");	// 전 페이지로 반환
			script.print("</script>");
		}
		
	%>
</body>
</html>