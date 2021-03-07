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
<script type="text/javascript">
	function deleteP() {
		if(confirm("해당 상품을 장바구니에서 삭제 하시겠습니까?")){
			location.href ='deletecartlistproduct.jsp?ProductID='+ProductID
		}else{
			location.href ='cartlist.jsp'
		}
	}
</script>

	<%@include file ="menu.jsp" %>
	
		<div class="jumbotron">
			<div class="container">
				<h1> 장바구니 </h1>
			</div>
		</div>			
	
		
		<%
			request.setCharacterEncoding("UTF-8");
			ProductDao dao = ProductDao.getinstance();
			ArrayList<Product> listProducts = (ArrayList<Product>)session.getAttribute("cartlist");	
			if(listProducts == null){
				listProducts = new ArrayList<>();
			}
			int sum = 0;
			int total = 0;
		
		%>
		<div class="container">
			<div class="col-md-12">				
				<div style="padding-top: 50px; margin-bottom: 50px;" >
				<%// 제품 테이블 %>
				<table class="table table-hover">
					<tr>
						<th> 상품 이미지 </th>
						<th> 상품명 </th>
						<th> 분류 </th>
						<th> 상품가격 </th>
						<th> 수량 </th>
						<th> 금액 </th>
						<th> 비고 </th>
					</tr>
			<%
			if(listProducts.size() == 0){
			%>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>담은 상품 없음</td>						
						<td></td>
						<td></td>
						<td></td>
					</tr>
						
			<% 	
			}else{
				for(int i = 0; i<listProducts.size(); i++){
					Product product = listProducts.get(i);
			%>
					<tr>
											<% // 열 고정 태그 %>
					<td width="150" style="word-break:break-all"><img src="image/<%=product.getFilename()%>" style="width: 50%">
						<br> <%=product.getFilename() %>
					</td>
						<td><%=product.getPname() %></td>
						<td><%=product.getPprice() %></td>
						<td><%=product.getCategory() %></td>
						<td><%=product.getQuantity() %></td>
						<% sum = product.getPprice()*product.getQuantity();%>
						<td><%=sum %>원</td>
							<%total +=sum; %>
						<td>
								<a href="#" class="btn btn-info" onclick="deletecartlistproduct.jsp('<%=product.getProductID()%>')">삭제</a>
						</td>	
					</tr>
			<%
				}
			}
			%>
					</table>
					총 결제금액 :<%=total %>원
					<div>
						<table>
							<tr>
								<td align="left"><a href="deletecartlist.jsp" class="btn btn-info">모두 비우기</a> </td>
								<td align="left"><a href="customer.jsp" class="btn btn-info">결제</a> </td>
							</tr>
						</table>
					</div>
					</div>
				</div>
			</div>
		
		<%@include file ="footer.jsp" %>

</body>
</html>