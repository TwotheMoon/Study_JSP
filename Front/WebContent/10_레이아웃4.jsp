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
	#header{
		height: 60px;
		background-color: #dddddd;
	}
	#sidebar{
		width: 200px;
		height: 300px;
		background-color: orange; 
		float: left;
	}
	#section{
		width: 700px;
		height: 300px;
		float: right;
		background-color: skyblue;
	}
	#footer{
		clear: both;
		height: 80px;
		background-color: green;
	}
</style>
</head>
<body>

	<div id="web">
		<div id="header">
			상단 헤더
		</div>
		<div id="sidebar">
			사이드바
		</div>
		<div id="section">
			메인 섹션
		</div>
		<div id="footer">
			하단 푸터
		</div>
	</div>

</body>
</html>