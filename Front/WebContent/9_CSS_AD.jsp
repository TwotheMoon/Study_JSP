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
	<h1 class="head-title"> ����� �巹�� �� </h1>
	<h3 class="head-subtitle"> Special Dress Shop </h3>
	<p class="main-text"> ����, ��ȥ�����, ���� ����� �� Ư���� ���� ����� �巹���� �԰� ���������� ���� �߾��� ���ܺ�����.
	<div>
		<img class="mid-img" src="img/dress.jpg">
	</div>
	<div>
		<ol>
			<li class="mid-info"> �Ⱓ : ���� ��/�Ͽ���<br> 13:00 ~ �����ð� ������ </li>
			<li class="mid-info"> ��� : ���ǰ �Ǹ��� �� ����� �巹��<br> &#8251; Ű�� Ŀ�� �巹���� �԰� �Ǿ����! </li>
		</ol>
	</div>
		<a href="#">
			<div class="bot-button">
				<span class="bot-button-text"> �̿��� �� �̿��� </span>
			</div>
		</a>
</div>
</body>
</html>