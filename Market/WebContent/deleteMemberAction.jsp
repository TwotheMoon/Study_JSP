<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	request.setCharacterEncoding("UTF-8");
    	String id = request.getParameter("id");
    	MemberDao dao = MemberDao.getinstance();
    
    	dao.deleteMember(id);
    	
    	response.sendRedirect("editmember.jsp");

    %>
    