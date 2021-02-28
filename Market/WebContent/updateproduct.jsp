
<%@page import="java.awt.Stroke"%>
<%@page import="com.oreilly.servlet.MultipartResponse"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		
		<script type="text/javascript">
			function checkadd() {
				
				// 상품명은 최소 4글자 이상
				if(newproduct.pname.value.length < 4 || newproduct.pname.value.length > 50 ){
					alert("[상품명]\n최소4글자 ~ 최대 50까지 입력해주세요 ");
					newproduct.pname.focus();
					return false;
				}
				// 가격 문자 체크
				if(newproduct.pprice.value.length == 0 || isNaN(newproduct.pprice.value) ){
												// ISNaN(값) : 해당 값의 null값 여부 판단 메소드
					alert("[가격]\n숫자만 입력 ");
				return false;
			}
				// 가격 음수 체크
				if(newproduct.pprice.value < 0){
					alert("[가격]\양수만 입력 ");	
				return false;
				}
				// 가격 문자 체크
				if(newproduct.pinstock.value.length == 0 || isNaN(newproduct.pinstock.value) ){	
												// ISNaN(값) : 해당 값의 null값 여부 판단 메소드
					alert("[재고]\n숫자만 입력 ");
				return false;
				}
				// 가격 음수 체크
				if(newproduct.pinstock.value < 0){
					alert("[재고]\양수만 입력 ");	
				return false;
				}
			}
		</script>
		
		<%
			String ProductID = request.getParameter("ProductID");
			ProductDao dao = ProductDao.getinstance();
			Product product = dao.getProduct(ProductID);
		%>
		
		<div class="container">
			<form name="newproduct" method="post" action="updateProductAction.jsp" enctype="multipart/form-data" onsubmit="return checkadd()">
	
				<div class="form-group row">
					<label class="col-sm-2">상품코드</label>
					<div class="col-sm-3">
						<input type="text" name="ProductID" class="form-control" value="<%=product.getProductID() %>" readonly="readonly">
					</div>
					<label>*수정불가</label>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상품명</label>
					<div class="col-sm-3">
						<input type="text" name="pname" class="form-control" value="<%=product.getPname()%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상품가격</label>
					<div class="col-sm-3">
						<input type="text" name="pprice" class="form-control" value="<%=product.getPprice()%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상품 설명</label>
					<div class="col-sm-3">
						<textarea rows="5" cols="30" name="description" class="form-control"><%=product.getDescription()%></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">제조사</label>
					<div class="col-sm-3">
						<input type="text" name="manufacturer" class="form-control" value="<%=product.getManufacturer()%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">분류</label>
					<div class="col-sm-3">
						<input type="text" name="category" class="form-control" value="<%=product.getCategory()%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">재고 수</label>
					<div class="col-sm-3">
						<input type="text" name="pinstock" class="form-control" value="<%=product.getPinstock()%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상태</label>
					<div class="col-sm-3">
					<%if(product.getconditions().equals("New")) {
					%>	
						<input type="radio" name="conditions" value="New" checked="checked"> 신제품
						<input type="radio" name="conditions" value="Old"> 기존제품					
					<% 
					}else{
					%>
						<input type="radio" name="conditions" value="New"> 신제품
						<input type="radio" name="conditions" value="Old" checked="checked"> 기존제품
					<% 
					}
					%>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이미지파일</label>
					<div class="col-sm-3">
							<input type="hidden" name="oldfilename" value="<%=product.getFilename() %>" >
							<input type="file" name="filename" class="form-control" >
							<label>기존파일 : <%=product.getFilename()%></label>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-3"></div>
					<input type="submit" class="btn btn-primary" value="수정">
				</div>
			</form>
		</div>
		
	<%@include file ="footer.jsp" %>

</body>
</html>