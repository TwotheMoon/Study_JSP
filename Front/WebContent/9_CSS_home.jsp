<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.main-cont{
		width: 500px;
		margin: 0px auto;
	}
	.con-imgbox, .con-textbox{
		border: solid 1px #eeeeee;
		padding: 10px;
	}
	.con-imgbox_bottext span:nth-child(2),
	.con-imgbox_bottext span:nth-child(5)
	{
		color: orange;
	}

</style>
</head>
<body>
	<%@include file="9_CSS_menu.jsp" %>
	
<div class="main-cont">
	<h2> å �Ż�ǰ </h2>
	<div class="con-imgbox">
		<img src="img/book.jpg">
	</div>
	<div class="con-textbox">
		<h3> �����̾� �ڹ� å ��Ʈ ...</h3>
		<h4> 25,000��</h4>
		<p> �Ǹ��ڰ� ����Ű�� �ڹ� å�Դϴ�. ������, �����, ������Ʈ ���� �� Ư���ѳ��� ��� ������
		<div class="con-imgbox_bottext">
			<span>���� </span>
			<span>130</span>
			<span>&middot;</span>
			<span>���� </span>
			<span>4.9/5</span>
		</div>
	</div>
</div>
</body>
</html>