<%@page import="userData.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset = UTF-8">		<%// html 페이지 속성 %>
<meta name="viewport" content="width=device-width" , initial-scale = "1">	<%// 반응형 웹 만들기위해 %>
<link rel="stylesheet" href="css/bootstrap.css">	<%// 스타일시트(부트스트랩) 링크 %>
<title>회원정보</title>
</head>
<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") != null);
		userID = (String)session.getAttribute("userID");
	
		User user = new UserDAO().userInfo(userID);
	%>
	
	<nav class="navbar navbar-default">	<%// 메뉴바 선언 %>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapase-1"
					aria-expanded="false">
				<span class="icon-bar"></span>	<%//오른쪽 아이콘바 %>	
				<span class="icon-bar"></span>	
				<span class="icon-bar"></span>	
			</button>
			<a class="navbar-brand" href="main.jsp">jsp 홈페이지</a>
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="main.jsp">공지사항</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">로그인<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>	<%// 메뉴바 끝 %>
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center">회원정보</h3>
					
					<div class="form-group">
						<span> 아이디 : </span> 
						<span><%=user.getUserID()%></span>	
					</div>
					<div class="form-group">
						<span> 비밀번호 : </span> 
						<span><%=user.getUserPassword()%></span>
					</div>
					<div class="form-group">
						<span> 이름 : </span> 
						<span><%=user.getUserName()%></span>	
					</div>					<%// 부트스트랩 클래스 %>
					<div class="form-group">
						<span> 성별 : </span> 
						<span><%=user.getUserGender()%></span>
					</div>	
					<div class="form-group">
						<span> 이메일 : </span> 
						<span><%=user.getUserEmail()%></span>	
					</div>			
						<a href="deleteUser.jsp" >
							<input type="button" value="회원탈퇴" class="btn btn-primary form-control">
						</a>
					
						<a href="modify_input.jsp" >	
							<input type="button" value="회원정보수정" class="btn btn-primary form-control">
						</a>
						<a href="myWrite.jsp" >	
							<input type="button" value="내가쓴글" class="btn btn-primary form-control">
						</a>
				</form>
			</div>
		</div>
	</div> 
		<div class="col-lg-4"></div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>