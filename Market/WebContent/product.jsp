
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
				<h1> 제품 정보 </h1>
			</div>
		</div>			
		
		<%
			request.setCharacterEncoding("UTF-8");
			String ProductID = request.getParameter("ProductID");
			
			ProductDao dao = ProductDao.getinstance();
			
			Product product = dao.getProduct(ProductID);
			
		%>
		
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<img alt="" src="image/<%=product.getFilename()%>" style="width: 100%">
					</div>
					
					<div class="col-md-7">
						<h3><%=product.getPname() %></h3>
						<p> <%=product.getDescription() %>
						<p> 상품 코드 : <%=product.getProductID() %>
						<p> 상품 제조사 : <%=product.getManufacturer() %>
						<p> 상품 분류 : <%=product.getCategory() %>
						<p> 상품 재고 : <%=product.getPinstock() %>
						<p> 상품 가격 : <%=product.getPprice() %>
					</div>
				</div>
			</div>
		<%@include file ="footer.jsp" %>
</body>
</html>