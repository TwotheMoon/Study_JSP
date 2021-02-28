
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
	

<script type="text/javascript">
	function checkadd2() {
		
		var regx = /^[a-zA-Z0-9]*$/;
		
		if( !regx.test(newmember.id.value) ){
			alert("영문/숫자 조합만 가능합니다.");
			return false;
		}
		if( !newmember.id.value){
			alert(" 아이디 입력해주세요. ");
			return false;
		}
		if( !newmember.password.value){
			alert(" 비밀번호를 입력해주세요. ");
			return false;
		}
	}
	
	function idcheck(id) {
		
	var regx = /^[a-zA-Z0-9]*$/;
		
		if( !regx.test(newmember.id.value) ){
			alert("영문/숫자 조합만 가능합니다.");
			return false;
		}
		if( !newmember.id.value){
			alert(" 아이디 입력해주세요. ");
			return false;
		}
		// 중복체크 DB 연동후 기입
	}
</script>

<title>Insert title here</title>
</head>
<body>

	<%@include file ="menu.jsp" %>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<div class="jumbotron">
			<div class="container">
				<h1> 로그인 </h1>
			</div>
		</div>			
		
		<div class="container" style="padding-top: 20px">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="jumbotron" >
					<form name="newmember" method="post" action="addloginAction.jsp"  onsubmit="return checkadd2()">
						<div class="form-group row">
							<label class="col-sm-3">아이디</label>
							<div class="col-sm-9">
								<input type="text" name="id" class="form-control" placeholder="아이디" maxlength="20">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">비밀번호</label>
							<div class="col-sm-9">
								<input type="password" name="password" class="form-control" placeholder="비밀번호" maxlength="20">
							</div>
						</div>
								<button type="submit" value="로그인" class="btn btn-lg btn-success btn-block"> 로그인 </button>
					</form>
				</div>
			</div>
		</div>
		
	<%@include file ="footer.jsp" %>

</body>
</html>