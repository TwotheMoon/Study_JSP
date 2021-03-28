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
	<h2> 책 신상품 </h2>
	<div class="con-imgbox">
		<img src="img/book.jpg">
	</div>
	<div class="con-textbox">
		<h3> 프리미엄 자바 책 세트 ...</h3>
		<h4> 25,000원</h4>
		<p> 판매자가 직접키운 자바 책입니다. 집들이, 기념일, 프로젝트 참여 등 특별한날에 들고 가세요
		<div class="con-imgbox_bottext">
			<span>리뷰 </span>
			<span>130</span>
			<span>&middot;</span>
			<span>평점 </span>
			<span>4.9/5</span>
		</div>
	</div>
</div>
</body>
</html>