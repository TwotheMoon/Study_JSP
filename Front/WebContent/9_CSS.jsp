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

	<p> display �Ӽ�
	
	<p> inline �⺻�� : span a img input button select ��
		<p> : ���� �������� ��ġ // �ڽ��� �ȿ��� width , height ����x // ���ϴ� ����x 
	<p> block �⺻�� : div p h1 form table li �� 
		<p> : ���ο� �ٿ� ��� ǥ�� // �ڽ��� �ȿ��� width , height ����o	// ���ϴ� ����o
	
	<h1> display : inline </h1>
	<div>
		����1 <span id="text1">�ȳ��ϼ���</span> ����2
	</div>
	
	<h1> display : block </h1>
	<div>
		����1 <span id="text2">�ȳ��ϼ���</span> ����2
	</div>
		
	<h1> display : inline-block </h1>
	<div>
		����1 <span id="text3">�ȳ��ϼ���</span> ����2
	</div>
	
	<h1> display : none </h1>
	<div>
		����1 <span id="text4">�ȳ��ϼ���</span> ����2
	</div>
	
	<p>
	����1<span id="a">���</span> ����2 
		<span id="b">���</span> ����3 
		<span id="c">���</span> ����4

	<p> ����Ʈ�� �۸Ӹ� ��ȣ
	<ul>
		<li> �Ⱓ : 2023.23.42 ~ 12.23 5�ϰ�</li>
		<li> ��� : ���� �ǰ����� �Ű��� �����Դϴ�.</li>
		<li> ���� : ŷ������ ��� ������ ȭ����</li>
	</ul>
	

</body>
</html>