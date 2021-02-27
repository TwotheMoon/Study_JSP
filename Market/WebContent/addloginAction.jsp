<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:useBean id="member" class="member"></jsp:useBean>

    <%
    		request.setCharacterEncoding("UTF-8");
			String logID = null;
			if(session.getAttribute("logID") != null){
				logID = (String)session.getAttribute("logID");
			}
			if(logID != null){
				PrintWriter script = response.getWriter();
				script.print("<script>");
				script.print("alert('이미 로그인 되어있습니다.');");
				script.print("location.href = 'main.jsp'");
				script.print("</script>");
			}
			
 %>	
 <% 
				MemberDao memberDao = new MemberDao();
 				int result = memberDao.login(Member.getId, Member.getPassword);
 
 				
 				if( result == 1){
				session.setAttribute("logID", Member.get);
			}


        	String logID = request.getParameter("logid" , Member.getId);
        	String logPassword = request.getParameter("password");
        	
      
        	MemberDao dao = MemberDao.getinstance();
        	Member member = new Member();
        	    
        	member.setId(logID);
        	
        	dao.login(logID, logPassword);
        	
        	response.sendRedirect("main.jsp");
    %>
    