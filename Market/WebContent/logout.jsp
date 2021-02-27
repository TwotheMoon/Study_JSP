
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
		session.invalidate();
	%>	
	
	<script type="text/javascript">
		alert("로그아웃");
		location.href = "loginmember.jsp";
	</script>
</body>
</html>