<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	h3{
		text-align: center; 
		font-family: "궁서";
		text-shadow: 3px 3px 5px #666666;
		}
	p{
		line-height: 150%;
		font-size: 20px;
		
	}
	span{
		text-decoration: underline;
		font-style: italic;
		font-weight: bold;
		letter-spacing: 10px;
	}
	a{
		text-decoration: none;
		color: grey;
	}
	a:hover {
	color: tomato;
	}
	a:active {
	color: blue;
	}
	a:visited {
	color: orange;
	}
</style>
</head>
<body>
	<p> 글자 스타일 css
	<p> 1. font-family : 글꼴
		<p> font-size : 글자 크기
		<p> font-style: italic : 기울기
		<P> font-weight: bold; : 글씨 굵기
		<p> letter-spacing: 글자 간격
	<p> 2. text-shadow : 오른쪽그림자길이 아래쪽그림자 길이 오퍼시티정도 그림자 색상
	<p> 3. text-align : 정렬
	<p> 4. line-height : 줄 간격
	<p> 5. text-decoration : 텍스트 선
	<p> 6. 링크 꾸미기
	<p> a:link  링크 속성
	<p> a:hover  마우스 올렸을때 속성
	<p> a:active  클릭한 순간 속성 
	<p> a:visited  한번 이상 방문 했을때 속성
	
	<h3>먹어도 배고파… 가짜 배고픔 을 아시나요</h3> 
	<p>먹어도 배고파… 가짜 배고픔을 아시나요. <span>김수진 헬스조선 기자.</span> 2015/05/14 14:30.  한 남성이 초콜릿을 먹고 있다.
		사진=조선일보 DB. 식사 시간을 ...
	<p> <a href="https://www.naver.com"> 네이버로 가기</a>
</body>
</html>