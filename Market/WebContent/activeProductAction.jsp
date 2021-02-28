<%@page import="java.io.PrintWriter"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	request.setCharacterEncoding("UTF-8");
    	String ProductID = request.getParameter("ProductID");
    	ProductDao dao = ProductDao.getinstance();
    
    	int result = dao.activation(ProductID);
    	
    	if(result == 1){
    		PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('변경 성공');");
			script.print("location.href = 'editproduct.jsp'");
			script.print("</script>");
    	}else{
    		PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('db오류');");
			script.print("history.back()");
			script.print("</script>");
    	}
    	

    %>
    