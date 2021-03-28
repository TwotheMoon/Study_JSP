<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	*{
		text-align: center;
		padding-top: 30px;
	}
	#web{
		width: 900px;
		margin: 0px auto;
	}
	header{
		height: 60px;
		background-color: #dddddd;
	}
	aside{
		width: 200px;
		height: 300px;
		background-color: orange; 
		float: left;
	}
	section{
		width: 700px;
		height: 300px;
		float: right;
		background-color: skyblue;
	}
	footer{
		clear: both;
		height: 80px;
		background-color: green;
	}
</style>
</head>
<body>

	<div id="web">
		<header>
			상단 헤더
		</header>
		<aside>
			사이드바
		</aside>
		<section>
			메인 섹션
		</section>
		<footer>
			하단 푸터
		</footer>
	</div>

</body>
</html>