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
		
		request.setCharacterEncoding("UTF-8");
		
		String key = request.getParameter("key");
		String keyword = request.getParameter("keyword");
		ArrayList<Product> listProducts = new ArrayList<>();
		
		ProductDao dao = ProductDao.getinstance();
		
		// 재고가 0 이면 업데이트 => 활성화 : 2변경
		dao.soldout();
		
				// 검색이 없을경우
		if( key == null || keyword == null){
			 listProducts = dao.getAllProducts();
		}else{			
			 listProducts = dao.searchGetALLProducts(key, keyword);
		}
		
	
					
	%>
		<div class="container">
		<div class="col-md-3">
			<%@include file="adminsidebar.jsp"  %>
		</div>
		<div class="col-md-9">	
		
			
			<div style="padding-top: 50px">
			
			<% // 조회 %>
			<div class="col-sm-6"> <%// 공백 %></div>
			<div class="col-sm-6">
				<form action="editproduct.jsp" method="post" name="form">
					<div class="form-group row">
						<div class="col-sm-4">
							<select name="key" class="form-control">
								<option value="productID">상품코드</option>
								<option value="pname">상품명</option>
								<option value="manufacturer">제조사</option>
								<option value="category">분류</option>
							</select>
						</div>
						
						<div class="col-sm-7">
							<input type="text" name="keyword" placeholder="search" class="form-control">	
						</div>
						
						<div class="col-sm-1">
							<input type="submit" value="조회" class="btn btn-default">
						</div>
					</div>
				</form>
			</div>
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
					<th> 활성화</th>
				</tr>
			<%
			// 리스트 개수가 == 0 인경우 => 제품이 없는경우 / 검색 결과가 없는경우
			if(listProducts.size() == 0){
			%>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>조회 결과 없음</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			<% 
			}else{	// 제품이 있는경우				
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
				<%
					if(product.getPinstock() == 0){
				%>
					<td>매진</td>
				<% 		
					}else{
				%>
					<td><%=product.getPinstock() %></td>
				<%
					}
				%>
					<td><%=product.getconditions() %></td>
				<%
					if(product.getActivation() == 1){
				%>
					
					<td>판매중</td>
				<% 
					}else if(product.getActivation() == 0){
				%>
					<td>미판매</td>
				<% 
					}else if(product.getActivation() == 2){
				%>
					<td>매진</td>
				<% 		
					}
				%>
				<td><a href="updateproduct.jsp?ProductID=<%=product.getProductID() %>" class="badge badge-danger"> 수정 </a></td>
				<td><a href="deleteProductAction.jsp?ProductID=<%=product.getProductID() %>" class="badge badge-danger"> 삭제 </a></td>
				<td><a href="activeProductAction.jsp?ProductID=<%=product.getProductID() %>" class="badge badge-danger"> 판매 </a></td>
				</tr>
				
			<%
					}
				}	
			%>
			</table>
			</div>
			</div>
		</div>


</body>
</html>