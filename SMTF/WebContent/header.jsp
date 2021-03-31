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
<title> Maxrava | 웨이트너를 위한 소셜 네트워크 </title>
<!-- 제이쿼리 임포트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<header class="header-box">
		<ul class="header-menu">
			<li class="header-list header-logo">로고</li>
			<li class="header-list header-about">회사소개</li>
			<li class="header-list header-signup">회원가입</li>
			<li class="header-list header-careers">커리어</li>
				
			<li class="menu-btn">
				<i class="fas fa-bars fa-2x"></i>
			</li>
			<li onclick="history.back();" class="page_cover"></li>
			<li id="menu">
			  	<h3 class="menu-title"> MENU </h3>
			  	<div onclick="history.back();" class="close">
			  		<i class="fad fa-times-circle fa-2x"></i>
			  	</div>
			  	<div class="menu-login menu-contents"> 로그인 <!-- 로그인시 세션 아이디 출력 --> </div>
			  	<div class="menu-signup menu-contents"> 회원가입 </div>
			  	<div class="menu-questions menu-contents"> 문의사항 </div>
			  	<!-- ------------------------------------------------- -->
			  	<div class="menu-about menu-info"> 회사소개 </div>
			  	<div class="menu-careers menu-info"> 커리어 </div>
			  	<div class="menu-sponsors menu-info"> 스폰서 </div>
			</li>
		</ul>		
    </header>
    
<script> /* 사이드 메뉴 애니메이션 스크립트 */
	$(".menu-btn").click(function() {
		$("#menu,.page_cover,html").addClass("open");
			window.location.hash = "#open";
	});
		
		window.onhashchange = function() {
			if (location.hash != "#open") {
		  	$("#menu,.page_cover,html").removeClass("open");
		}
	};
</script>
</body>
</html>