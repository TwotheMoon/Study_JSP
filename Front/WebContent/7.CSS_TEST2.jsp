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
			<h2>������ ���� å�ΰ�?</h2>
		</div>
	</div>
	<div class="contents contents1_info">
		<p> - <span>���α׷��� �Թ�</span>�� ���Ͻôº�<br>
			- java ���� �ͼ��ѵ� ���̽��� ó���� ��<br>
			- ���� �� ���� ������� ���̽��� �����Ϸ��� ��
	</div>
		<div class="contents2">
			<div class="contents2_title-num" >
				02
			</div>
		<div class="contents2_title-text" >
			<h2>�� å�� Ư¡</h2>
		</div>
	</div>
	
	<div class="contents contents2_info">
		<p> - ����ְ�<span>�پ��� �ǽ� ����</span><br>
			- YOUTUBE ������ ������ ����<br>
			- �پ��� ���̵��� �������� �ټ� ����
	</div>		
</div>
</body>
</html>