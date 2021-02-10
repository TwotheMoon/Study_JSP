<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset = UTF-8">
<meta name="viewport" content="Width=device-width" , initial-scale = "1">
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="EUC-KR">
<title> 회원가입 </title>
</head>
<body>
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
		<div class="collapse navbar-collapse" id="bs-examole-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="notice.jsp">공지사항</a></li>
				<li><a href="board.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">로그인<span class="caret"></span>
					</a>
					<ul	class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<%// 메뉴바 끝 %>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align:center; ">회원가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active" >
								<input type="radio" name="userGender" value="남자" autocapitalize="off" checked="checked">남자
							</label>
							<label class="btn btn-warning active" >
								<input type="radio" name="userGender" value="남자" autocapitalize="off" checked="checked">여자
							</label>
						</div>
					</div>					
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail">
					</div>
					
					<input type="submit" value="회원가입" class="btn btn-success form-control">
				</form>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>