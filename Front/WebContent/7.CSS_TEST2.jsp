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
			height: 200vh;
			display: flex;
			flex-direction: column;

		}
	.top-img{
		width: 400px;
	}
	.contents1{
		display: flex;
		flex-direction: row;	
	}
	.contents2{
		display: flex;
		flex-direction: row;
		margin-top: 20px;
	}
	.contents1_title-num{
		font-size: 50px;
		color: #ff9900;
		padding-right: 15px;
	}
	.contents2_title-num{
		font-size: 50px;
		color: #ff9900;
		padding-right: 15px;
	}
	.contents1_title-text{
		padding-top: 10px;
	}
	.contents2_title-text{
		padding-top: 10px;
	}
	.contents{
		background-color: #ffffcc;
	}
	.contents1_info{
		padding: 10px;
	}
	
	.contents2_info{
		padding: 10px;
	}	
	.contents1_info>p>span{
		color: #ff9900;
	}
	.contents2_info>p>span{
		color: #ff9900;
	}
</style>
</head>
<body>

<div class="main">
	<img src="img/book.jpg" class="top-img">
	
	<div class="contents1">
		<div class="contents1_title-num" >
			01
		</div>
		<div class="contents1_title-text" >
			<h2>누구를 위한 책인가?</h2>
		</div>
	</div>
	<div class="contents contents1_info">
		<p> - <span>프로그래밍 입문</span>을 원하시는분<br>
			- java 언어는 익숙한데 파이썬은 처음인 분<br>
			- 대학 및 교육 기관에서 파이썬을 강의하려는 분
	</div>
		<div class="contents2">
			<div class="contents2_title-num" >
				02
			</div>
		<div class="contents2_title-text" >
			<h2>이 책의 특징</h2>
		</div>
	</div>
	
	<div class="contents contents2_info">
		<p> - 재미있고<span>다양한 실습 예제</span><br>
			- YOUTUBE 동영상 콘텐츠 제공<br>
			- 다양한 난이도의 연습문제 다수 제공
	</div>		
</div>
</body>
</html>