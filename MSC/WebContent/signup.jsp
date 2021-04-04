<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 외부 css 연결 -->
    <link rel="stylesheet" href="css/styles.css?after"/>
     <!-- 아이콘 불러오는 스크립트 -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-iKbFRxucmOHIcpWdX9NTZ5WETOPm0Goy0WmfyNcl52qSYtc2Buk0NCe6jU1sWWNB" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport"  content="width=device-width, initial-scale=1.0" />
<!-- 제이쿼리 임포트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 다음 맵 api 임포트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<title> Muscle Challenge | 웨이트너를 위한 소셜 네트워크 </title>
</head>
<body id="main">
	
	<header class="header box"><%@include file="header.jsp" %></header> 
    
    <div class="signup-box">
    	<h2> 회원가입 </h2>
    	
    	<form action="login.jsp" method="post">
    		<div class="signup-table">
    			<div>
    				<label> 아이디 </label>
    				<input class="signup-id-input" type="text" name="" placeholder="아이디" size="12" > 
    			</div>
    			<div>
    				<label> 패스워드 </label>
    				<input class="signup-pw-input" type="password" name="" placeholder="패스워드" size="12" >
 				</div>
 				<div>
	    			<label> 패스워드 확인 </label>
	    			<input class="signup-pwConfirm-input" type="password" name="" placeholder="패스워드 확인" size="12">
	    		</div>	
	    		<div>	
	    			<label> 이름 </label> 
	    			<input class="signup-name-input" type="text" name="" placeholder="이름" size="6">
	    		</div> 
	    		<div>	
	    			<label> 성별 </label> 
	    			<input class="signup-gender-input" type="radio" name="" placeholder="성별" checked="checked"> 남 
	    			<input type="radio" name="" placeholder="성별"> 여 
	    		</div>
	    		<div>
	    			<label> 생년월일 </label>
	    			<input class="signup-birth-input" type="text" name="" placeholder="년도(4자리)" maxlength="4" size="6"> 년 &nbsp;&nbsp;
					<input type="text" name="" placeholder="월(2자리)" maxlength="2" size="4"> 월 &nbsp;&nbsp;
					<input type="text" name="" placeholder="일(2자리)" maxlength="2" size="4"> 일 &nbsp;&nbsp;
				</div>
	    		<div>	
	    			<label> 전화변호 </label>
	    			<input class="signup-phone-input" type="text" name="" size="2" maxlength="3" placeholder="010"> -
	    			<input type="text" name="" size="4" maxlength="4"> -
	   				<input type="text" name="" size="4" maxlength="4">	
	   			</div>
	   			<div>	
	   				<label> 이메일 </label>	 
	    			<input class="signup-email-input" type="text" name="" placeholder="이메일" size="10">@ 				
	    			<select name="">
	    				<option>직접입력</option>
	    				<option>naver.com</option>
	    				<option>gmail.com</option>
	    				<option>daum.net</option>
	    			</select>
	    		</div>
	    		<div>	
	    			<label> 근무지 </label> 
	   				<input class="signup-workplace-input" type="text" name="" placeholder="근무지">
				</div>
				<div>    			
	    			<label> 출신학교 </label> 
	    			<input class="signup-school-input" type="text" name="" placeholder="출신학교">
	    		</div>
	   			<div>	
	   				<label> 주소 </label>
	   				<input class="signup-address-input1" type="button" onclick="sample4_execDaumPostcode()" value="주소검색"> 
	   				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name=""> 
	   				<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="">
	   				<input type="text" id="sample4_postcode" placeholder="우편번호" name="" size="6">
	     		</div>
	     		<div>
	     			<input class="signup-address-input2" type="text" id="sample4_jibunAddress" placeholder="지번주소" name="">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목" name="">
	    		</div>
	   			<div>	
	   				<label> 3대 중량 </label>
	    			<input class="signup-weight-input" type="text" name="" placeholder="스쿼트" size="5"> kg &nbsp;&nbsp;
	    			<input type="text" name="" placeholder="데드리프트" size="5"> kg &nbsp;&nbsp;
	   				<input type="text" name="" placeholder="벤치프레스" size="5"> kg &nbsp;	&nbsp;
	   			</div>
	   			<div>
    				<input class="signup-submit" type="submit" value="등록">
    				<input class="signup-cancle" type="reset" value="취소">
    			</div>
    		</div>
    	</form>
    </div>

    <footer class="footer box"><%@include file="footer.jsp" %></footer>

</body>
</html>