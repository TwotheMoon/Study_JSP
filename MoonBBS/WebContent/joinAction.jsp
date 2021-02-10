<%@page import="userData.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="userData.User.*" %>
    <%@ page import="java.io.*" %>
    <%request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="user" class="userData.User"></jsp:useBean>
    <jsp:setProperty property="userID" name="user"></jsp:setProperty>
    <jsp:setProperty property="userPassword" name="user"></jsp:setProperty>
    <jsp:setProperty property="userName" name="user"></jsp:setProperty>
    <jsp:setProperty property="userGender" name="user"></jsp:setProperty>
    <jsp:setProperty property="userEmail" name="user"></jsp:setProperty>
    <jsp:setProperty property="manager" name="user"></jsp:setProperty>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Join Action </title>
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
		script.print("alert('입력 안된 사항이 있습니다.');");
		script.print("history.back()");
		script.print("</script>");		
	}
	else{
		if( result == 1){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("location.href = 'login.jsp'");
			script.print("</script>");
		}
		if( result == -1){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('중복된 아이디 입니다.');");
			script.print("history.back()");
			script.print("</script>");		
		}
	}
	
	
	%>
</body>
</html>