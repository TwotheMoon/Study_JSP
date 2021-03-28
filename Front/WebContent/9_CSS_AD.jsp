<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	body{
		width: 600px;
		margin: 0px auto;
	}
	.main{
		width: 600px;
		height: 100vh;
		background-image: url("img/patten1.jpg");
		opacity: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;	
	}
	.mid-img{
		width: 250px;
		height: 320px;
		padding-bottom: 30px;
	}
	.head-title{
		font-size: 50px;
		font-weight: bold;
	}
	.head-subtitle	{
		font-size: 30px;
		margin-top: -20px;
	}
	.head-title, .head-subtitle{
		text-shadow: 1px 1px 0px black;
		color: yellow;
	}
	.main-text{
		color: white;
		padding: 0px 70px 40px 70px;
		
	}
	.mid-info{
		color: yellow;
		list-style: disc;
		margin-bottom: 10px;
		text-shadow: 1px 1px 0px black;
	}
	.bot-button{
		background: yellow;
		color: black;
		width: 200px;
		height: 80px;
	}
	.bot-button{
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		width: 400px;
		height: 80px;
		
	}
	.bot-button-text{
		font-size: 25px;
		font-weight: bold;
		font-family: monospace;
	}
	a:link, a:active, a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>

<div class="main">
	<h1 class="head-title"> 스페셜 드레스 샵 </h1>
	<h3 class="head-subtitle"> Special Dress Shop </h3>
	<p class="main-text"> 생일, 결혼기념일, 만난 기념일 등 특별한 날에 스페셜 드레스를 입고 포토존에서 멋진 추억을 남겨보세요.
	<div>
		<img class="mid-img" src="img/dress.jpg">
	</div>
	<div>
		<ol>
			<li class="mid-info"> 기간 : 매주 토/일요일<br> 13:00 ~ 마감시간 전까지 </li>
			<li class="mid-info"> 장소 : 기념품 판매점 옆 스페셜 드레스<br> &#8251; 키즈 커플 드레스도 입고 되었어요! </li>
		</ol>
	</div>
		<a href="#">
			<div class="bot-button">
				<span class="bot-button-text"> 이용요금 및 이용방법 </span>
			</div>
		</a>
</div>
</body>
</html>