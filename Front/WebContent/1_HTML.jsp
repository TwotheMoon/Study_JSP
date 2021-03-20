<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	HTML : 웹문서 태그언어
	
	1. h1 ~ h6 : 글 제목 태그
	<h1> HTML 제목 </h1>
	<h2> HTML 제목 </h2>
	<h3> HTML 제목 </h3>
	<h4> HTML 제목 </h4>
	<h5> HTML 제목 </h5>
	<h6> HTML 제목 </h6>
	
	2. 단락 : p
	<h2> 웹 페이지란? </h2>
	<p> 하이퍼텍스트 마크업 언어는 웹 페이지를 위한 지배적인 마크업 언어다. 
		또한, HTML은 제목, 단락, 목록 등과 같은 본문을 위한 구조적 의미를 나타내는 것뿐만 아니라 
		링크, 인용과 그 밖의 항목으로 구조적 문서를 만들 수 있는 방법을 제공한다. 
	<p>최신 버전: HTML 5.2
		최근 버전 출시일: 2017년 12월 17일
		미리보기 버전 출시일: 2018년 10월 18일
		미리보기 버전: HTML 5.3 (초안)
		개발자: W3C와 WHATWG
		
	3. 줄바꿈 : br
	<p> 하이퍼텍스트 마크업 언어는 웹 페이지를 위한 지배적인 마크업 언어다. <br>
		또한, HTML은 제목, 단락, 목록 등과 같은 본문을 위한 구조적 의미를 나타내는 것뿐만 아니라 <br> 
		링크, 인용과 그 밖의 항목으로 구조적 문서를 만들 수 있는 방법을 제공한다. <br>
	<p>최신 버전: HTML 5.2 <br>
		최근 버전 출시일: 2017년 12월 17일	<br>
		미리보기 버전 출시일: 2018년 10월 18일 <br>
		미리보기 버전: HTML 5.3 (초안) <br>
		개발자: W3C와 WHATWG <br><br>
	
	4. 특수문자 : &기호표기 
		<p> &nbsp; &lt; 특수문자사용 &gt; 
		&amp; &quot; &#39;
		하이퍼텍스트 마크업 언어는 웹 페이지를 위한 지배적인 마크업 언어다. <br>
		또한, HTML은 제목, 단락, 목록 등과 같은 본문을 위한 구조적 의미를 나타내는 것뿐만 아니라 <br> 
		링크, 인용과 그 밖의 항목으로 구조적 문서를 만들 수 있는 방법을 제공한다. <br><br>
	
	5. 이미지 : img
	<p> 1. alt : 사진 설명
	<p> 2. src : 사진 경로
	<p> 3. 크기 조절 : width : 가로길이 // height : 세로길이
	<p> 		// 픽셀[절대크기] : 점[ 이미지를 표현하는 점 ] 
				// 퍼센트[상대크기] : 사진 상대크기<br>
				
	<img alt="" src="img/bg2.jpg" width="300px">
	<img alt="" src="img/bg2.jpg" width="200px" height="200px">
	<img alt="" src="img/bg2.jpg" width="80%">
	<p> 사진 포맷 : // 1. jpg // 2.png // 3.gif // 4.svg
	
	<p> 파일 경로 
	<p> 상대 경로 : ../bg2.jpg
	<p> 절대 경로 : ./img/bg2.jpg
	<img alt="" src="./bg2.jpg"> 실행x
	<img alt="" src="./img/bg2.jpg">
	<img alt="" src="./img/test/bg2.jpg"> 실행x
	<img alt="" src="../img/bg2.jpg"> 실행x <br>
	
	6. 오디오 태그 audio
	<p> // 1. controls = 화면에 플레어 표시
		// 2. autoplay = 자동실행
	
	<audio controls="controls" src="img/Da Jazz Blues - Doug Maxwell_Media Right Productions.mp3"></audio>
	
	<p> 7. 비디오 태그 video

	<video controls="controls" width="300px" height="300px" >
		<source src="img/Moon - 59026.mp4" type="video/mp4">
	</video>
	
	<p> // 유튜브 [ 외부 영상 ]
	<iframe width="560" height="315" src="https://www.youtube.com/embed/IpDuHHN00mY?controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	
	<p> 8. 순서[번호]없는 목록 : ul li
		<h2> 오늘 손질할 재료 할일 </h2>
		<ul>
			<li>민새우 나누기</li>
			<li>무야호</li>
			<li>볼로네제 소스</li>
			<li>피자 소스</li>
			<li>피데기 오징어 2가지 재조</li>
			<li>사천식 닭 조지기</li>
		</ul>
	
	<p> 9. 순서[번호]있는 목록 : ol li
		<h2> 오늘 손질할 재료 할일 </h2>
		<ol>
			<li>민새우 나누기</li>
			<li>무야호</li>
			<li>볼로네제 소스</li>
			<li>피자 소스</li>
			<li>피데기 오징어 2가지 재조</li>
			<li>사천식 닭 조지기</li>
		</ol>
		
		<p> 10. 링크 : a 태그
		<p> target="_blank" : 새창으로 열기
		<ol>
			<li><a href="http://www.naver.com" target="blank">민새우 나누기</a></li>
			<li><a href="http://www.naver.com">무야호</a></li>
			<li><a href="http://www.naver.com">볼로네제 소스</a></li>
			<li><a href="http://www.naver.com">피자 소스</a></li>
			<li><a href="http://www.naver.com">피데기 오징어 2가지 재조</a></li>
			<li><a href="http://www.naver.com">사천식 닭 조지기</a></li>
		</ol>
		
		
</body>
</html>