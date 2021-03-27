<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	div{
		background-color: #eeeeee;
	}
	span{
		border: solid 1px;
	}
	#text1{
		display: inline;
	}
	#text2{
		display: block;
	}
	#text3{
		display: inline-block;
	}
	#text4{
		display: none;
	}
	span{
		border: solid 1px black;
		background-color: yellow; 
	}
	#a{
		width: 100px;
		height: 100px;
		margin: 20px;
	}
	#b{
		width: 100px;
		height: 100px;
		margin: 20px;
		display: block;
	}
	#c{
		width: 100px;
		height: 100px;
		margin: 20px;
		display: inline-block;
	}
	li{
		list-style: armenian;
		list-style: url("img/head.png");
	}
	
</style>
</head>
<body>

	<p> display 속성
	
	<p> inline 기본값 : span a img input button select 등
		<p> : 수평 방향으로 배치 // 박스권 안에서 width , height 적용x // 상하단 마진x 
	<p> block 기본값 : div p h1 form table li 등 
		<p> : 새로운 줄에 요소 표시 // 박스권 안에서 width , height 적용o	// 상하단 마진o
	
	<h1> display : inline </h1>
	<div>
		글자1 <span id="text1">안녕하세요</span> 글자2
	</div>
	
	<h1> display : block </h1>
	<div>
		글자1 <span id="text2">안녕하세요</span> 글자2
	</div>
		
	<h1> display : inline-block </h1>
	<div>
		글자1 <span id="text3">안녕하세요</span> 글자2
	</div>
	
	<h1> display : none </h1>
	<div>
		글자1 <span id="text4">안녕하세요</span> 글자2
	</div>
	
	<p>
	글자1<span id="a">요소</span> 글자2 
		<span id="b">요소</span> 글자3 
		<span id="c">요소</span> 글자4

	<p> 리스트내 글머리 기호
	<ul>
		<li> 기간 : 2023.23.42 ~ 12.23 5일간</li>
		<li> 장소 : 용형 건강보단 신곡이 먼저입니다.</li>
		<li> 주최 : 킹전만해 브걸 누나들 화이팅</li>
	</ul>
	

</body>
</html>