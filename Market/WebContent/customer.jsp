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

<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
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
		%>
		<div class="container">
			<div class="col-md-12">				
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
					<tr onclick="location.href='product.jsp?ProductID=<%=product.getProductID()%>'" >
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
					</tr>
			<%
				}
			}
			%>
					</table>
				</div>
			</div>
					총 결제금액 :<%=total %>원
		</div>
				<% 
					if( userID == null){
						
				%>
				<%
				MemberDao memberDao = MemberDao.getinstance();
				Member member = memberDao.getMember(userID);
				%>
	<div class="container" style="padding-top: 20px">
			<div class="col-sm-0"></div>
			<div class="col-sm-12">
				<div class="jumbotron" >
					<form name="newmember" method="post" action="shoppingAction.jsp"  onsubmit="return checkadd2()">
						<div class="form-group row">
							<h4> 받는 사람[비회원]</h4>
							<label>* 필수 입력사항</label>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">받는사람*</label>
							<div class="col-sm-9">
								<input type="text" name="name" class="form-control" placeholder="이름" maxlength="20" >
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">비밀번호*</label>
							<div class="col-sm-9">
								<input type="password" name="password" class="form-control" placeholder="비밀번호" maxlength="20">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">비밀번호 확인*</label>
							<div class="col-sm-9">
								<input type="text" name="password_confirm" class="form-control" placeholder="비밀번호 확인" maxlength="20">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">전화번호*</label>
							<div class="col-sm-9">
								<select name="phone1" >
									<option>010</option>
									<option>02</option>
									<option>031</option>
								</select> -
								<input type="text" name="phone2" maxlength="4" size="6" >
								<input type="text" name="phone3" maxlength="4" size="6"  > 
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">주소*</label>
							<div class="col-sm-6">
								<input type="text" id="sample4_postcode" placeholder="우편번호" class="form-control" name="address1" >
							</div>
							<div class="col-sm-3">
								<input type="button" onclick="sample4_execDaumPostcode()" value="주소검색" class="form-control"><br>
							</div>
						</div>
						<div class="form-group row">	
							<div class="col-sm-8">
								<input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" name="address3" >
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" placeholder="상세주소" class="form-control" name="address4">
							</div>
							<div class="col-sm-4">
								<input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="form-control" name="address2">
								<input type="text" id="sample4_extraAddress" placeholder="참고항목" class="form-control" name="address5">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-5"></div>
							<div style="padding-left: 15px">
								<input type="submit" value="등록" class="btn btn-info">
								<input type="reset" value="취소" class="btn btn-info">
						</div>
					</div>
				</form>		
			</div>
		</div>		
				<% 
					}else{
							MemberDao memberDao = MemberDao.getinstance();
							Member member = memberDao.getMember(userID);
				%>
		<div class="container" style="padding-top: 20px">
			<div class="col-sm-0"></div>
			<div class="col-sm-12">
				<div class="jumbotron" >
					<form name="newmember" method="post" action="shoppingAction.jsp"  onsubmit="return checkadd2()">
						<div class="form-group row">
							<h4> 받는 사람[회원]</h4>
							<label>* 필수 입력사항</label>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">받는사람*</label>
							<div class="col-sm-9">
								<input type="text" name="name" class="form-control" value="<%=member.getName() %>" maxlength="20">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">전화번호*</label>
							<div class="col-sm-9">
							<%
								String[] phone = member.getPhone().split("-");
							%>
								<select name="phone1">
									<option>010</option>
									<option>02</option>
									<option>031</option>
								</select>
								<input type="text" name="phone2" maxlength="4" size="6" value="<%=phone[1]%>">
								<input type="text" name="phone3" maxlength="4" size="6" value="<%=phone[2]%>"> 
							</div>
						</div>
						<%
							String[] address = member.getAddress().split(",");
						%>
						<div class="form-group row">
							<label class="col-sm-3">주소*</label>
							<div class="col-sm-6">
								<input type="text" id="sample4_postcode" placeholder="우편번호" class="form-control" name="address1" value="<%=address[0]%>">
							</div>
							<div class="col-sm-3">
								<input type="button" onclick="sample4_execDaumPostcode()" value="주소검색" class="form-control"><br>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-8">
								<input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" name="address3" value="<%=address[2]%>">
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" placeholder="상세주소" class="form-control" name="address4" value="<%=address[3]%>">
							</div>
							<div class="col-sm-4">
								<input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="form-control" name="address2" value="<%=address[1]%>">
								<input type="text" id="sample4_extraAddress" placeholder="참고항목" class="form-control" name="address5" value="<%=address[4]%>">
							</div>
						</div>
							<div class="form-group row">
								<label class="col-sm-3">요청사항</label>
							</div>
							<div>
								<input type="text" name="requests" class="form-control">
							</div>
						<div class="form-group row">
							<div class="col-sm-5"></div>
							<div style="padding-left: 15px">
								<input type="submit" value="등록" class="btn btn-info">
								<input type="reset" value="취소" class="btn btn-info">
							</div>
						</div>
					</form>
				</div>
			</div>
				<% 		
						}
				%>
		</div>		
	</div>
		
		<%@include file ="footer.jsp" %>

</body>
</html>