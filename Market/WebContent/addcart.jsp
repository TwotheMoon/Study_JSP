
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

	<%// 상품id => 상품정보 호출 => 리스트 담기 => 리스트 세션에 저장  %>	
	<%
		String ProductID = request.getParameter("ProductID");
		
		ProductDao dao = ProductDao.getinstance();
		Product product = dao.getProduct(ProductID); // 담는 상품
		
		ArrayList<Product> goodslist = dao.getAllProducts();	// 모든 상품
		
		for( int i = 0; i < goodslist.size(); i++ ){
			if( goodslist.get(i).getProductID().equals(ProductID) ){
				product = goodslist.get(i);
				break; // 해당 상품을 검색 성공
			}
		}
		
		// 장바구니[세션 불러오기]
		ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
		if( list == null ){ // 세션이 존재하지 않으면
			list = new ArrayList<Product>();
			session.setAttribute("cartlist", list);	// 세션 생성
		}
		
		int count = 0; // 상품마다 담은 갯수
		
		// 모든 상품에서 해당 상품을 찾아 => 
		for(int i = 0; i<list.size(); i++){
			if(list.get(i).getProductID().equals(ProductID)){
				count++;
				list.get(i).setQuantity(list.get(i).getQuantity()+1);
			}
		}
		
		// 리스트 담기	// 첫 상품 담은 갯수가 0이면 
		if( count == 0){
		product.setQuantity(1);
		list.add(product);
		}
		response.sendRedirect("product.jsp?ProductID="+ProductID);
		
		%>

</body>
</html>