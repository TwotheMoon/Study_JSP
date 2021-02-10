<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="userData.*" %>
    <%@ page import="java.io.*" %>
    
    <jsp:useBean id="user" class="userData.User" ></jsp:useBean>
    <jsp:setProperty property="userID" name="user" />
   	<jsp:setProperty property="userPassword" name="user" />
    
<!DOCTYPE html>
<html>
<head>
<title> Login Action</title>
</head>
<body>
	
	
	<% 
	// 세션 존재 했을떄 세션을 변수에 저장
	String userID = null; 
	if( session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID"); // 세션불러와 userID 변수에 저장
	}
	if(userID != null){ //세션 변수에 이미 세션이 있을경우
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('이미 로그인 되어있습니다.');");
		script.print("location.href ='main.jsp'");
		script.print("</script>");
	}
	%>
	<% 
	// 로그인 성공시 아이디 세션 값 저장
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID() , user.getUserPassword());
	
	if( result == 1){
		
		session.setAttribute("userID", user.getUserID());
		
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("location.href ='main.jsp'");
		script.print("</script>");	
	}
	
	if(result == 0){
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('비빌번호가 다릅니다.');");
		script.print("history.back()");
		script.print("</script>");
	}
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('존재하지 않는 아이디입니다.');");
		script.print("history.back()");
		script.print("</script>");
	}
	
	if(result == -2){
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('DB접근 오류');");
		script.print("history.back()");
		script.print("</script>");
	}
	%>
</body>
</html>