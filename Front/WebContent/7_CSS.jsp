<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style type="text/css">
		*{	/* ��ü ������ */
			color: green;
			margin: 0px;
			padding: 0px;
		}
		
		/* �±� ������ = HTML �±׸� */
		body{}
		h1{}
		p{}
		span{}
		
		/* �׷� ������ = ������1, ������2 */
		h2, h3{}
		p, ul{}
		/* ���̵� */
		#p1{
		color: red; 
		}
		#p2{
			background-color: blue;
		}
		/* Ŭ���� */
		.c1{ color: aqua;}
		.c2{ color: fuchsia;}
		/* ���� ������*/
		#main h3{
			background-color: olive;
		}
		#intro h3{
			background-color: navy; 
		}
	</style>
</head>
<body>

	<p> ������ : �ٹ̱� ���
	<p id="p1"> 1. html �±�	=> 	�±׸� { }
	<p id="p2"> 2. class	=>	.Ŭ������ { }
	<p class="c1"> 3. id		=> #id��{  }
	<p class="c2"> 4. * 		=> *{  } : ��ü ����
	<p> 5. ������, 	=> ������, ������2{  } : ���� ������ �ٹ̱�
	<p> 6. ���� ������ 	= div p{   }	: div �±� �ȿ� ��� p �±� �ٹ̱�


	<div id="main">
		<h3>
			����������
		</h3>
	</div>
	<div id="intro">
		<h3>
			����������
		</h3>
	</div>
</body>
</html>