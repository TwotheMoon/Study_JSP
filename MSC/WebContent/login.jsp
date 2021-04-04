<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 외부 css 연결 -->
    <link rel="stylesheet" href="css/styles.css?after"/>
     <!-- 아이콘 불러오는 스크립트 -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-iKbFRxucmOHIcpWdX9NTZ5WETOPm0Goy0WmfyNcl52qSYtc2Buk0NCe6jU1sWWNB" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport"  content="width=device-width, initial-scale=1.0" />
<!-- 제이쿼리 임포트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title> Muscle Challenge | 웨이트너를 위한 소셜 네트워크 </title>
</head>
<body id="main">
	
	<header class="header box"><%@include file="header.jsp" %></header> 
    
    <div class="login-box">
    	<h2> 로그인 </h2>
    	
    	<form action="#" method="post">
    		<div class="login-table">
    			<div>
    				<label> 아이디 </label>
    				<input class="login-id-input" type="text" name="" placeholder="아이디" size="12" > 
    			</div>
    			<div>
    				<label> 패스워드 </label>
    				<input class="login-pw-input" type="password" name="" placeholder="패스워드" size="12" >
 				</div>
	   			<div>
    				<input class="login-submit" type="submit" value="로그인">
    			</div>
    		</div>
    	</form>
    </div>

    <footer class="footer box"><%@include file="footer.jsp" %></footer>

</body>
</html>