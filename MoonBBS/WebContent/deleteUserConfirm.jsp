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
<title>회원탈퇴 하시겠습니까?</title>
</head>
<body>

	<% String userID = null;
	if(session.getAttribute("userID") !=null){
		userID = (String)session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>			
			</button>
			<a class="navbar-brand" href="main.jsp">Moon jsp Page</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="notice.jsp">공지사항</a></li>
				<li><a href="board.jsp">게시판</a></li>
			</ul>
			
			<% //////////////////////////////////////////////////////////////// %>
			
			<%
				if( userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">로그인<span class="caret"></span>
					</a>
					<ul	class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
	<% 
		}
		else{	
	%>
					<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logout.jsp">로그아웃</a></li>
							<li class="active"><a href="userData.jsp">회원정보</a></li>
						</ul>
					</li>
				</ul>
	<% 
		}
	%>
		</div>
	</nav>	<%// 메뉴바 끝 %>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="deleteUser.jsp">
					<h3 style="text-align: center;"> 회원탈퇴 </h3>
					<div class="form-group" style="text-align: center;" >
						<span> 정말로 탈퇴하시겠습니까? </span>
					</div>
					<div style="text-align: center;">
						<a href="userData.jsp">
							<input type="button" value="아니요" class="btn btn-primary">
						</a>
						<a href="deleteUser.jsp">
							<input type="button" value="예" class="btn btn-primary">
						</a>
					</div>
				</form>
			</div>		
		</div>
	</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>