
<%@page import="dto.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%// 1.부트스트랩 연결 %>
	<link rel="stylesheet" href="css/bootstrap.css" ><%// css 가져오기 %>
	<meta http-equiv="content-Type" content="text/html" charset="UTF-8"><%// 페이지 속성 %>
	<meta name="viewport" content="width=device-width initial-scale-1">	<%// 반응형 웹 %>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
<title>Insert title here</title>
</head>
<body>

	<%@include file ="menu.jsp" %>
	
		<div class="jumbotron">
			<div class="container">
				<h1> 제품 등록 </h1>
			</div>
		</div>			
		
		<div class="container">
			<form method="post" action="addProductAction.jsp" enctype="multipart/form-data">
	
				<div class="form-group row">
					<label class="col-sm-2">상품코드</label>
					<div class="col-sm-3">
						<input type="text" name="ProductID" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상품명</label>
					<div class="col-sm-3">
						<input type="text" name="pname" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상품가격</label>
					<div class="col-sm-3">
						<input type="text" name="pprice" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상품 설명</label>
					<div class="col-sm-3">
						<textarea rows="5" cols="30" name="description" class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">제조사</label>
					<div class="col-sm-3">
						<input type="text" name="manufacturer" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">분류</label>
					<div class="col-sm-3">
						<input type="text" name="category" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">재고 수</label>
					<div class="col-sm-3">
						<input type="text" name="pinstock" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상태</label>
					<div class="col-sm-3">
						<input type="radio" name="conditions" value="New"> 신제품
						<input type="radio" name="conditions" value="Old"> 기존제품
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이미지파일</label>
					<div class="col-sm-3">
						<input type="file" name="filename" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-3"></div>
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</form>
		</div>
		
	<%@include file ="footer.jsp" %>

</body>
</html>