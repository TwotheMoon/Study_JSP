<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<p> 폼 : form
	<p> 1. input : 입력 요소
	<p> 2. select : 선택 박스
	<p> 3. textarea : 여러줄 입력
	
	<form>
		이름[text : 값넣기] : <input type="text" value="이더문"> <br>
		이름[text : 읽기모드] : <input type="text" value="이더문" readonly="readonly"> <br>
		이름[text : 입력예시] : <input type="text" placeholder="성명입력" > <br>
		이름[text : 사용불가] : <input type="text" placeholder="성명입력" disabled="disabled"> <br>
		
		비밀번호[password : 포커스] : <input type="password" autofocus="autofocus"> <br>
		
		이메일 수신[radio] : <input type="radio" name="email" checked="checked">예
						  <input type="radio" name="email">아니요 <br> 
		
		분야[checkbox] : <input type="checkbox" name="item1"> 뉴스
						<input type="checkbox" name="item2"> 드라마
						<input type="checkbox" name="item3"> 스포츠
						<input type="checkbox" name="item4"> 엔터
						<input type="checkbox" name="item5"> 기타 <br><br>
		
		파일[file] : <input type="file"> <br><br>
		
		버튼[input] : <input type="submit" value="보내기">
		버튼[] : <input type="button" value="중복확인">
		버튼[] : <input type="reset" value="다시작성"> <br><br>
		
		버튼[button] : <button type="submit">보내기</button>
		버튼[] : <button type="button">중복확인</button>
		버튼[] : <button type="reset">다시작성</button> <br><br>
		
		이메일 : <input type="email"> <br><br>
		
		이메일 : <input type="text" >@ 
		<select>
			<option>naver.com</option>
			<option>gmail.com</option>
			<option>hanmail.net</option>
		</select><br><br>
		
		리뷰 : <textarea rows="6" cols="80"></textarea>
	</form>
	
	<p> 테이블 태그
	<p> 1. tr : 행 추가
	<p> 2. td : 데이터 입력
	<p> 3. th : 열 제목	
	<p> 4. border : 테두리 선
	<p> 5. colspan : 열 병합
	<table border="1" style="border-color: tomato;">
		<tr>
			<th>지역</th><th colspan="2">최저기온/최고기온</th>
		</tr>	
		<tr>
			<td rowspan="2">서울</td><td>20</td><td>30</td>
		</tr>
		<tr>
			<td>2</td><td>21</td>
		</tr>
		
		<tr>
			<td rowspan="2">대구</td><td>32</td><td>85</td>
		</tr>
		
		<tr>
			<td>15</td><td>25</td>
		</tr>
		
		
	</table>

</body>
</html>