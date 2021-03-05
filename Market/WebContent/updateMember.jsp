
<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
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
		if( newmember.password.value != newmember.password_confirm.value){
			alert("비밀번호가 동일하지 않습니다.");
			return false;
		}
		if( !newmember.name.value){
			alert(" 이름 입력해주세요. ");
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
		// 중복체크 db연동 후 작성
	}
</script>

<title>Insert title here</title>
</head>
<body>

	<%@include file ="menu.jsp" %>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<div class="jumbotron">
			<div class="container">
				<h1> 회원 정보 수정 </h1>
			</div>
		</div>			
		<%
			request.setCharacterEncoding("UTF-8");
		
			String id = request.getParameter("id");
			MemberDao dao = MemberDao.getinstance();
			Member member = dao.getMember(id);
		%>
	
		<div class="container" style="padding-top: 20px">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="jumbotron" >
					<form name="newmember" method="post" action="updateMemberAction.jsp"  onsubmit="return checkadd2()">
						<div class="form-group row">
							<label>* 필수 입력사항</label>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">아이디*</label>
							<div class="col-sm-6">
								<input type="text" value="<%=member.getId() %>" name="id" class="form-control" placeholder="아이디" maxlength="20">
							</div>
							<div class="col-sm-3">
								<input type="button" class="form-control" value="중복체크" onclick="idcheck(this.form.id.value)">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">비밀번호*</label>
							<div class="col-sm-9">
								<input type="password" value="<%=member.getPassword()%>" name="password" class="form-control" placeholder="비밀번호" maxlength="20">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">비밀번호 확인*</label>
							<div class="col-sm-9">
								<input type="text" value="<%=member.getPassword() %>" name="password_confirm" class="form-control" placeholder="비밀번호 확인" maxlength="20">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">성명*</label>
							<div class="col-sm-9">
								<input type="text" value="<%=member.getName() %>" name="name" class="form-control" placeholder="이름" maxlength="20">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">성별</label>
							<div class="col-sm-9">
								<input type="radio" name="gender" value="남">남
								<input type="radio" name="gender" value="여">여
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">생년월일</label>
							<div class="col-sm-9">
								<input type="text" name="birthyy" placeholder="년도(4자리)" maxlength="4" size="8">
								<input type="text" name="birthmm" placeholder="월(2자리)" maxlength="2" size="6">
								<input type="text" name="birthdd" placeholder="일(2자리)" maxlength="2" size="6">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">이메일</label>
							<div class="col-sm-9">
								<input type="text" name="mail1" placeholder="이메일" maxlength="50" size="">@
								<select name="mail2">
									<option>naver.com</option>
									<option>gmail.com</option>
									<option>daum.net</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3">전화번호</label>
							<div class="col-sm-9">
								<select name="phone1">
									<option>010</option>
									<option>02</option>
									<option>031</option>
								</select> -
								<input type="text" name="phone2" maxlength="4" size="6">
								<input type="text" name="phone3" maxlength="4" size="6"> 
							</div>
						</div>
							<div class="form-group row">
							<label class="col-sm-3">주소</label>
							<div class="col-sm-6">
								<input type="text" id="sample4_postcode" placeholder="우편번호" class="form-control" name="address1">
							</div>
							<div class="col-sm-3">
								<input type="button" onclick="sample4_execDaumPostcode()" value="주소검색" class="form-control"><br>
							</div>
						</div>
						<div class="form-group row">
							
							<div class="col-sm-8">
								
								<input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" name="address3">
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
		</div>
		
	<%@include file ="footer.jsp" %>

</body>
</html>