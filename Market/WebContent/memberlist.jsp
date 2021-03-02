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
</head>
<body>

	<%@include file ="menu.jsp" %>
	
		<div class="jumbotron">
			<div class="container">
				<h1> 회원 목록 </h1>
			</div>
		</div>			
		
		<%
			request.setCharacterEncoding("UTF-8");
			
			String key = request.getParameter("key");
			String keyword = request.getParameter("keyword");
			ArrayList<Member> listMembers = new ArrayList<>();
			
			 //검색이 없을경우
			if( key == null || keyword == null){
				MemberDao dao = MemberDao.getinstance();
				listMembers = dao.getAllMembers();
			// 검색이 있을경우
			}else{ 
				MemberDao dao = MemberDao.getinstance();
				listMembers = dao.searchGetALLMembers(key, keyword);// 멤버 찾기 메소드 만들기
						
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
				<form action="editmember.jsp" method="post" name="form">
					<div class="form-group row">
						<div class="col-sm-4">
							<select name="key" class="form-control">
								<option value="id">아이디</option>
								<option value="name">이름</option>
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
			<%// 제품 테이블 %>
			<table class="table table-hover">
				<tr>
					<th> 어이디 </th>
					<th> 패스워드 </th>
					<th> 이름 </th>
					<th> 생년월일 </th>
					<th> 성별</th>
					<th> 이메일 </th>
					<th> 연락처 </th>
					<th> 주소 </th>
					<th> 회원가입 날짜 </th>
					<th>  </th>	
				</tr>
			<%
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
			}else{
				for(int i = 0; i<listMembers.size(); i++){
					Member member = listMembers.get(i);

			%>
				<tr>
					<td><%=member.getId() %></td>
					<td><%=member.getPassword() %></td>
					<td><%=member.getName() %></td>
					<td><%=member.getGender() %></td>
					<td><%=member.getBirth() %></td>
					<td><%=member.getMail() %></td>
					<td><%=member.getPhone() %></td>
					<td><%=member.getAddress() %></td>
					<td><%=member.getRegist_day() %></td>
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