<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDao"%>
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
<%  
	if(session.getAttribute("userID") != null ){
		userID = (String)session.getAttribute("userID");
	}
%>
	
		<% // 캐러셀 %>
		
		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="5000">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1" ></li>
					<li data-target="#myCarousel" data-slide-to="2" ></li>
				</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img alt="" src="image/carousel1.png" >
						</div>
						<div class="item">
							<img alt="" src="image/carousel2.png" >
						</div>
						<div class="item">
							<img alt="" src="image/carousel3.png" >
						</div>
					</div>
				<a class="left carousel-control" href="#myCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" ></span>
				</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" ></span>
				</a>
			</div>
		</div>	<%// 캐러셀 끝 %>
	
		<div class="container">
			<div class="text-center">	
				<h2> 노트북 </h2>	
			</div>
		</div>
		
		<p>
		<p>
		<p>
		<p>
		<p>
		
		<%
			ProductDao dao = ProductDao.getinstance();
			ArrayList<Product> listProducts = dao.getAllProducts();
		%>
		
		<div class="container">
			<div class="row" align="center">
			
			<%
				for(int i = 0; i<listProducts.size(); i++){
					Product product = listProducts.get(i);
			%>
				<div class="col-md-4">
					<a href="product.jsp?ProductID=<%=product.getProductID()%>"><img src="image/<%=product.getFilename() %>" style="width: 100%"></a>
						<h3> <%=product.getPname() %></h3>
						<p><%=product.getDescription() %>
						<p><%=product.getPprice() %>
						<p><a href="product.jsp?ProductID=<%=product.getProductID()%>" class="btn btn-primary" role="button"> 상세보기 </a>
				</div>
			<%	
				}	
			%>
			</div>
		</div>
	
	<%@include file ="footer.jsp" %>

</body>
</html>