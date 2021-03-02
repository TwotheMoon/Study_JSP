<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
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
				<h1> 회원 관리 </h1>
			</div>
		</div>			
		
	<%
		
		request.setCharacterEncoding("UTF-8");
		
		String key = request.getParameter("key");
		String keyword = request.getParameter("keyword");
		ArrayList<Member> listMembers = new ArrayList<>();
		
		MemberDao dao = MemberDao.getinstance();
		
		// 재고가 0 이면 업데이트 => 활성화 : 2변경
		//dao.soldout();
		
				// 검색이 없을경우
		if( key == null || keyword == null){
			 listMembers = dao.getAllMembers();
		}else{			
			 listMembers = dao.searchGetALLMembers(key, keyword);
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
								<option value="id">아이디</option>
								<option value="name">상품명</option>
								<option value="birth">생년월일</option>
								<option value="gender">성별</option>
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
					<th> 아이디 </th>
					<th> 패스워드 </th>
					<th> 이름 </th>
					<th> 생년월일 </th>
					<th> 성별 </th>
					<th> 이메일 </th>
					<th> 연락처 </th>
					<th> 주소 </th>
					<th> 회원가입 날짜 </th>
				</tr>
			<%
			// 리스트 개수가 == 0 인경우 => 제품이 없는경우 / 검색 결과가 없는경우
			if(listMembers.size() == 0){
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
			for(int i = 0; i<listMembers.size(); i++){
					Member member = listMembers.get(i);
			%>	
				<tr>
					<td><%=member.getId() %></td>
					<td><%=member.getPassword() %></td>
					<td><%=member.getName() %></td>
					<td><%=member.getBirth() %></td>
					<td><%=member.getGender() %></td>
					<td><%=member.getGender() %></td>
					<td><%=member.getGender() %></td>
			
				<td><a href="updateproduct.jsp" class="badge badge-danger"> 수정 </a></td>
				<td><a href="deleteProductAction.jsp" class="badge badge-danger"> 삭제 </a></td>
				<td><a href="activeProductAction.jsp>" class="badge badge-danger"> 판매 </a></td>
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