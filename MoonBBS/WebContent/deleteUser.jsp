<%@page import="java.io.PrintWriter"%>
<%@page import="userData.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset = UTF-8">		<%// html 페이지 속성 %>
<meta name="viewport" content="width=device-width" , initial-scale = "1">	<%// 반응형 웹 만들기위해 %>
<link rel="stylesheet" href="css/bootstrap.css">	<%// 스타일시트(부트스트랩) 링크 %>
<title>회원탈퇴</title>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('로그인 해주세요');");
		script.print("history.back()");
		script.print("/<script>");
	}
	
	UserDAO userDAO = new UserDAO();
	
	int result = userDAO.deleteUser(userID);
	
	if (result == 1){
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("location.href = 'login.jsp'");
		script.print("</script>");
	}
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('회원탈퇴 실패');");
		script.print("history.back()");
		script.print("</script>");
	}
	%>
</body>
</html>