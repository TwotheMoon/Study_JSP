<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="USER.*" %>
    <%@ page import="java.io.*" %>
    
    <jsp:useBean id="user" class="USER.User"></jsp:useBean>
    <jsp:setProperty property="userID" name="user"/>
    <jsp:setProperty property="userPassword" name="user"/>
    <jsp:setProperty property="userName" name="user"/>
    <jsp:setProperty property="userGender" name="user"/>
    <jsp:setProperty property="userEmail" name="user"/>
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
	
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		
		if(user.getUserID() == null || user.getUserPassword() == null ||
		   user.getUserName() == null || user.getUserGender() == null ||
		   user.getUserEmail() == null){			
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('입력 안된 사항이 있습니다.');"); // 오류 메세지
			script.print("history.back()");	// 전 페이지로 반환
			script.print("</script>");
		}
		else{
		
			if( result == 1){	// 로그인 성공
				PrintWriter script = response.getWriter();
				script.print("<script>");
				script.print("location.href ='main.jsp'");
				script.print("</script>");
			}
			if(result == -1){	// db 오류
				PrintWriter script = response.getWriter();
				script.print("<script>");
				script.print("alert('중복된 아이디 입니다.');"); // 오류 메세지
				script.print("history.back()");	// 전 페이지로 반환
				script.print("</script>");
			}
			
		}
		
	%>
</body>
</html>