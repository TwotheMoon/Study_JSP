<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	

    <%
    		request.setCharacterEncoding("UTF-8");
			
    		String userID = null;
    		if( session.getAttribute("userID") != null){
    			userID = (String)session.getAttribute("userID");
    		}
    		if(userID != null){
    			PrintWriter script = response.getWriter();
    			script.print("<script>");
    			script.print("alert('이미 로그인 되어있습니다.');");
    			script.print("location.href = 'main.jsp'");
    			script.print("</script>");
    		}
    		    
    		String logId = request.getParameter("id");
			String logPw = request.getParameter("password");
 	
			Member member = new Member();
			MemberDao memberDao = new MemberDao();
			int result = memberDao.login(logId, logPw);
			
			if(result == 1){
				session.setAttribute("userID", logId);
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("location.href = 'main.jsp'");
			script.print("</script>");
			}
			
			if(result == -1){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('아이디 혹은 비밀번호가 틀렸습니다.');");
			script.print("location.href = 'loginmember.jsp'");
			script.print("</script>");
			}
			
			if(result == -2){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('존재하지 않는 아이디입니다.');");
			script.print("history.back()");
			script.print("</script>");
			}
			
			
 
 %>	
 
			
 				
 
 				
 			
    