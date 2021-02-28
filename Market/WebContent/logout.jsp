
<%@page import="dto.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> logout </title>
</head>
<body>
	<%
		// 세션 없애기 // 장바구니 = 세션 / 로그인 = 세션
		session.setAttribute("userID", null);	// 세션은 안죽지만 로그아웃 효과
		
		response.sendRedirect("main.jsp");
		
	%>	
	
</body>
</html>