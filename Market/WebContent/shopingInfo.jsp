<%@page import="dto.Order"%>
<%@page import="dao.OrderDao"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="dao.MemberDao"%>
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
<script>	
	function deleteP() {
		if(confirm("해당 상품을 장바구니에서 삭제 하시겠습니까?")){
			deleteformP.submit();
		}else{
			deleteformP.reset();
		}
	}
</script>
</head>
<body>
	<%@include file ="menu.jsp" %>
	
		<div class="jumbotron">
			<div class="container">
				<h1> 결제 </h1>
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
			
			
			// 쿠키 호출
			String name = "";
			String password = "";
			String phone = "";
			String address = "";
			String requests = "";
			String timestamps = "";
			
			Cookie[] cookies = request.getCookies();
			
			if(cookies !=null){
				
				for(int i = 0; i < cookies.length; i++){
					Cookie temp = cookies[i];
					
					if(temp.getName().equals("name")){
						name = temp.getValue();	
					}
					if(temp.getName().equals("password")){
						password = temp.getValue();	
					}
					if(temp.getName().equals("phone")){
						phone = temp.getValue();	
					}
					if(temp.getName().equals("address")){
						address = URLDecoder.decode(temp.getValue()); 	
					}
					if(temp.getName().equals("requests")){
						requests = URLDecoder.decode(temp.getValue()); 
					}
					if(temp.getName().equals("timestamps")){
						timestamps = URLDecoder.decode(temp.getValue()); 
					}
				}
			}
		%>
	
		
		
		<div class="container"  >
			<div class="col-sm-3"></div>
			<div class="col-sm-6">				
				<div class="jumbotron">
					<h4>[주문완료] 주문해주셔서 감사합니다.</h4>
				</div>
			</div>
		</div>
		
		<div class="col-sm-6">
		<div class="container">
			<div class="col-md-9">				
				<div style="padding-top: 50px">
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
							<td>총 결제금액 :<%=total %>원</td>
					</tr>
			<%
				}
			}
			%>
					</table>
				</div>
			</div>		
		</div>
</div>

	<div class="container col-sm-6" style="padding-top: 20px">
			<div class="jumbotron" >
				<h4> 주문자</h4>
					<div class="col-sm-4"> 성명</div>
					<div class="col-sm-8"> <%=name %></div>
								
					<div class="col-sm-4"> 연락처</div>
					<div class="col-sm-8"> <%=phone %></div>
								
					<div class="col-sm-4"> 요청사항</div>
					<div class="col-sm-8"> <%=requests %></div>
								
					<div class="col-sm-4"> 배송주소</div>
					<div class="col-sm-8"> <%=address%></div>
								
					<div class="col-sm-4"> 주문일</div>
					<div class="col-sm-8"> <%=timestamps %></div>
			</div>
		
	</div>
	
	
		<%
			// 주문 사항 db에 저장
			
			Order order = new Order();
			order.setId((String)session.getAttribute("userID"));
			order.setOrder_address(address);
			order.setOrder_phone(phone);
			order.setOrder_requests(requests);
			order.setOrder_date(timestamps);
			order.setOrder_total_price(total);
			
			out.print(timestamps);
	
			
			
			OrderDao orderDao = OrderDao.getinstance();
			orderDao.setorder(order);
		%>
		
			

</body>
</html>