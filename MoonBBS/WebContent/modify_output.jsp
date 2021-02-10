<%@page import="java.io.PrintWriter"%>
<%@page import="userData.*"%>
<%@page import="userData.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Modify Output </title>
</head>
<body>
	<%
		String userNameModify = request.getParameter("userNameModify");
		String userGenderModify = request.getParameter("userGenderModify");
		String userEmailModify = request.getParameter("userEmailModify");
		
		String userID = null;
		if ( session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('로그인후 작성해주세요.');");
			script.print("location.href='login.jsp'");
			script.print("</script>");
		}else{
	
			User user = new UserDAO().userInfo(userID);
			UserDAO userDAO = new UserDAO();
			
			if(userNameModify == null || userGenderModify == null || userEmailModify == null)
			{
				PrintWriter script = response.getWriter();
				script.print("<script>");
				script.print("alert('입력되지 않는 사항이 있습니다.');");
				script.print("history.back()");
				script.print("/script");
			}
			else{
				int result = userDAO.updateUser(userNameModify, userGenderModify
						, userEmailModify
						, userID);
				if(result == 1){
					PrintWriter script = response.getWriter();
					script.print("<script>");
					script.print("location.href='userData.jsp'");
					script.print("</script>");
				}
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.print("<script>");
					script.print("alert('회원정보 수정 실패');");
					script.print("history.back()");
					script.print("</script>");
				}
			}
		}
	%>

</body>
</html>