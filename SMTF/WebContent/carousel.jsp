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
<body id="main">

	<div class="slider">
    	<input type="radio" name="slide" id="slide01" checked>
    	<input type="radio" name="slide" id="slide02">
    	<input type="radio" name="slide" id="slide03">
        
        <ul id="imgholder" class="imgs">
        	<li><img src="img/slide01.jpg"></li>
        	<li><img src="img/slide02.jpg"></li>
        	<li><img src="img/slide03.jpg"></li>
    	</ul>
    <div class="bullets">
        <label for="slide01">&nbsp;</label>
        <label for="slide02">&nbsp;</label>
        <label for="slide03">&nbsp;</label>
    </div>
</div>

</body>
</html>