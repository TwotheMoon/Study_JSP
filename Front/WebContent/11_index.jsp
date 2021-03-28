<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	@font-face {
    font-family: 'TmonMonsori';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	
	*{
		margin: 0px;
		padding: 0px;

	}
	li{
		list-style-type: none;
	}
	header{
		height: 170px;
	}
	.box{
		width: 1100px;
		margin: 0px auto;
	}
	#logo{
		float: left;
		margin: 30px 0px 0px 60px;
	}
	#menu{
		float: right;
		text-align: right;
		margin-right: 20px;
	}
	#menu li{
		display: inline-block;
	}
	#top_menu li{
		margin: 30px 0px 0px 10px;
		font-family: 'yg-jalnan';
		font-size: 13px;
	}
	#main_menu li{
		margin: 50px 0px 0px 80px;
		font-family: 'TmonMonsori';
	}
	#main_image{
		height: 320px;
		background-image: url("img/nightRainRoom.gif");
		background-repeat: no-repeat;
		background-position: center;
		text-align: center;
		margin-top: 30px;
	}
	#main_image img{
		margin-top: 250px;
	}
	aside{
		width: 220px;
		margin: 70px 0px;
		float: left;
	}
	aside .title1{
		padding: 12px;
		background-color: #0ca9a3;
		color: white;
		font-size: 18px;	
	}
	aside .comment{
		padding: 20px 10px;
		line-height: 150%;
	}
	aside .search input{
		width: 160px;
		height: 30px;
		border: solid 1px black;
		vertical-align: top;
	}
	aside .search button{
		margin-left: 5px;
		padding: 7px 10px;
		border: solid 1px black;
	}
	aside .title2{
		margin-top: 20px; 
		padding: 12px;
		border-top: solid 2px black;
		border-bottom: solid 1px #cccccc;
		font-size: 18px;
	}	
	aside .list{
		margin: 20px 0px;
	}
	aside .list	 li{
		margin: 10px 12px;
	}
	aside .ripple{
		border: solid 1px #0ca9a3;
		padding: 12px;
	}
	aside .ripple h2{
		font-size: 18px;
		margin: 10px 0px 15px 0px;
	}
	aside .ripple li{
		margin-top: 6px;
	}
	#main{
		width: 840px;
		float: left;
	}
	footer{
		height: 300px;
		clear: both;
		background-color: #05354e;
		color: white;
		margin-top: 100px;
	}
	#bottom_menu ul{
		padding: 20px 0px 0px 100px;
		font-weight: bold;
	}
	#bottom_menu li{
		display: inline;
		margin-right: 30px;
	}
	footer .items{
		float: left;
		margin: 40px 0px 0px 100px; 
	}
	footer h3{
		color: #0ca9a3;
	}
	footer .items ul{
		margin-top: 10px;
	}
</style>
</head>
<body>

	<header>
		<div class="box">
			<div id="logo">
				<img alt="" src="img/logo.png" width="130px;">
			</div>
			<nav id="menu">
				<ul id="top_menu">
					<li> �̴���(2theMoon)�� </li>
					<li> �α׾ƿ� </li>
					<li> �������� </li>
				</ul>
				<ul id="main_menu">
					<li> Home </li>
					<li> �⼮�� </li>
					<li> ��ǰ������ </li>
					<li> �Խ��� </li>
				</ul>
			</nav>
		</div>
	</header>
	
	<section id="main_image">
		<a href="http://2themoon.iptime.org"><img src="img/button.png" width="200px;"></a>
	</section>
	
	<div class="box">
		<aside>
			<h2 class="title1"> TheMoon ī�θ� </h2>
				<p class="comment"> ���� �ְ��� ��Ƽũ ���� ���� ����Ʈ The Moon ī�θ� �Դϴ�.</p>
			<div class="search">
				<input type="text"><button>�˻�</button>
			</div>
			<h2 class="title2"> �޴� ��� </h2>
				<ul class="list">
					<li> ���� ���� </li>
					<li> ���� ���� </li>
					<li> ��Ƽ��Ʈ </li>
				</ul>
				
			<div class="ripple">
				<h2> �ֱ� ��� </h2>
					<ul>
						<li> �ȳ��ϼ��� </li>
						<li> ���ǵ���� </li>
						<li> ��� ���� ��������...</li>
					</ul>
			</div>
		</aside>
		<section id="main">
			<%@include file="10_���̾ƿ�7.jsp" %>
		</section>	
	</div>
	
	<footer>
		<div class="box">
			<nav id="bottom_menu">
				<ul>
					<li> ȸ�� �Ұ� </li>
					<li> ��������ó����ħ </li>
					<li> ���۱� ���� </li>
					<li> �̿� �ȳ� </li>
				</ul>
			</nav>
				<div class="items">
					<h3> ���� ��ȭ </h3>
					<ul>
						<li> 1234-1234 </li>
						<li> 10:00 ~ 18:00 (Lunch 12:00 ~ 13:00) </li>
					</ul>
				</div>
				<div class="items">
					<h3> ȸ�� ���� </h3>
					<ul>
						<li> �ּ� : ����Ư���� ���� </li>
						<li> ��ȭ : 000-0000-0000 </li>
						<li> �ѽ� : 000-0000-0000 </li>
						<li> �̸��� : dlaguddh1@gmail.com </li>
					</ul>
				</div>
				<div class="items">
					<h3> �Ա� ���� </h3>
					<ul>
						<li> �������� : 012-30203-4245 </li>
						<li> �̴��� </li>
					</ul>
				</div>
		</div>
	</footer>

</body>
</html>