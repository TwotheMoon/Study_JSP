<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style type="text/css">
		body{
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		.main{
			width: 800px;
			height: 300vh;
			
		}
		.header{
			text-align: center;
		}
		.title{
			border-bottom: solid 5px black;
		}
		.contents{
			margin: 20px 0px;
		}
		.contents_img{
			width: 800px; 
		}
	</style>
</head>
<body>
	<div class="main">
	<div class="header">
		<h1> 경포 해수욕장 </h1>
		<h3> 강원도 강릉시</h3>
	</div>
	
	<div class="title">
		<h2> 기본 정보 </h2>
	</div>
	
	<div class="contents">
		경포 해수욕장은 강원도 강릉시 안현동에 위치한 해수욕장이다. 모래사장의 총면적은 144,000m², 길이는 1.8 km, 폭은 80m이다. 
		경포해수욕장은 강원도 강릉시 강문동·안현동 일대에 있는 동해안 최대의 해수욕장이다. 피서철에는 하루 평균 50만명의 피서인파가 몰리기도 한다.
	</div>
	<img src="img/해변.png" class="contents_img">
	<div class="bottom-contents">
		<ul>
			<li>홈페이지 : <a href="https://www.gn.go.kr/tour">https://www.gn.go.kr/tour</a> </li>
			<li>주소 : 강원도 강릉시 창해로 514</li>
			<li>애완견 : 동반가능, 시각장애인 편의시설</li>
			<li>주차 : 장애인 주차장 있음(공영주차장 내부) 매장에 편의시설 무료이용 가능</li>
			<li>유모차 : 대여가능(2대,경포해변 관리본부)</li>
		</ul>
	</div>
	</div>
</body>
</html>