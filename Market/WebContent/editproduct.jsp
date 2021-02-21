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
	
		<div class="jumbotron">
			<div class="container">
				<h1> 제품 관리 </h1>
			</div>
		</div>			
		
		<%
			ProductDao dao = ProductDao.getinstance();
			ArrayList<Product> listProducts = dao.getAllProducts();
		%>
		
		<div class="container">
			<table>
				<tr>
					<td align="left" style="padding-left: 20px"><a href="addproduct.jsp" class="btn btn-success"> 제품등록 </a></td>
				</tr>
			</table>
			<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th> 상품코드 </th>
					<th> 상품명 </th>
					<th> 상품가격 </th>
					<th> 상품설명 </th>
					<th> 제조사 </th>
					<th> 분류 </th>
					<th> 재고 </th>
					<th> 상태 </th>
					<th> 이미지 </th>
					<th></th>
					<th></th>
					
				</tr>
			
			<%
				for(int i = 0; i<listProducts.size(); i++){
					Product product = listProducts.get(i);
			%>
				
				<tr>
					<td><%=product.getProductID() %></td>
					<td><%=product.getPname() %></td>
					<td><%=product.getPprice() %></td>
					<td><%=product.getDescription() %></td>
					<td><%=product.getManufacturer() %></td>
					<td><%=product.getCategory() %></td>
					<td><%=product.getPinstock() %></td>
					<td><%=product.getconditions() %></td>
					<td><%=product.getFilename() %></td>
			
				<td><a href="updateproduct.jsp?Product=<%=product.getProductID() %>" class="badge badge-danger"> 수정 </a></td>
				<td><a href="deleteProductAction.jsp?Product=<%=product.getProductID() %>" class="badge badge-danger"> 삭제 </a></td>
				</tr>
				
			<%	
				}	
			%>
			</table>
			</div>
		</div>
		
	<%@include file ="footer.jsp" %>

</body>
</html>