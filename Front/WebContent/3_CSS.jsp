<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Hard Coding</title>

<style type="text/css">
	
	body{
		background-color: weat;
	}
	h2{
		font-family: "궁서";
		color: tomato;
	}
	p{
		font-family: "돋움";
		color: green;
		background-color: white;
	}
	.blue{
		color: blue;
		background-color: #0000ff;
	}
	#blue2{
	 	color: blue;
	 	background-color: rgb(0,255,255);
	}
	.blue-green{
		font-family: serif;
	}
</style>

</head>
<body>
	<p> CSS : HTML 효과 입히기
		<p> 1. HTML 태그 안에서 style 속성으로 꾸미기
		<p> 2. 선택자를 이용한 style 태그 내에서 선언
			<p> 1. 태그			선택자{   }
			<p> 2. class="선택자"	.클래스명{  }
			<p> 3. id = "id명"	#id{  }
			<p> 우선순위 : id > class > 태그
		<p> css 주석 : /* 주석 */ 
		<p> html 주석 : <!--  주석 -->

	<p> 헤더 head 태그 안에 style 태그 작성
	<p> 선택자 : 꾸미기 대상
	<p> h2{ 속성 : 속성값; }
	
	<p> 텍스트 속성
	<p> font-family : 글꼴 [디바이스에 설치된 폰트 기준]
	
	<p> 색상
	<P> 1.색이름 2.핵스값 [#ffffff] 3.RGB 값
	
	
	<h2>CSS</h2>
	<p class="blue blue-green">종속형 시트 또는 캐스케이딩 스타일 시트는 마크업 언어가 실제 표시되는 방법을 기술하는 언어로,
	   HTML과 XHTML에 주로 쓰이며, XML에서도 사용할 수 있다. W3C의 표준이며, 
	   레이아웃과 스타일을 정의할 때의 자유도가 높다
	   <p id="blue2">종속형 시트 또는 캐스케이딩 스타일 시트는 마크업 언어가 실제 표시되는 방법을 기술하는 언어로,
	   HTML과 XHTML에 주로 쓰이며, XML에서도 사용할 수 있다. W3C의 표준이며, 
	   레이아웃과 스타일을 정의할 때의 자유도가 높다

</body>
</html>