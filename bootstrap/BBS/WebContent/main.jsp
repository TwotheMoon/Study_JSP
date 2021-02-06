<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset = UTF-8">		<%// html 페이지 속성 %>
<meta name="viewport" content="width=device-width" , initial-scale = "1">	<%// 반응형 웹 만들기위해 %>
<link rel="stylesheet" href="css/bootstrap.css">	<%// 스타일시트(부트스트랩) 링크 %>
<title>Insert title here</title>
</head>
<body>

	<%
		String userID = null;
	if(session.getAttribute("userID") !=null){ // 로그인 되어있는경우
		userID = (String)session.getAttribute("userID");
	}

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
			
			<%/////////////////////////////////////////////////////////////////////////// %>
			
			<%
				if( userID == null){	// 세션이 없을경우
			%>	
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
					
			<% 
				}
				else{		// 세션이 있을경우
			%>		
					<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logout.jsp">로그아웃</a></li>
							<li class="active"><a href="Userdata.jsp">회원정보</a></li>
						</ul>
					</li>
				</ul>
			<%		
				}
			%>
			
		</div>
	</nav>	<%// 메뉴바 끝 %>
	
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
														<%// 사진이 넘어가는 시간 : 밀리초 %>
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" ></li>
				<li data-target="#myCarousel" data-slide-to="2" ></li>
			</ol>
				<div class="carousel-inner"> <%// 사진 첨부 %>
					<div class="item active" >
						<img src="images/bg1.jpg" >
					</div>
					<div class="item ">
						<img src="images/bg2.jpg" >
					</div>
					<div class="item ">
						<img src="images/bg3.png" >
					</div>
				</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" ></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" ></span>
			</a>
		
		</div>
	</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>