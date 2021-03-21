<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style type="text/css">
		*{	/* 전체 선택자 */
			color: green;
			margin: 0px;
			padding: 0px;
		}
		
		/* 태그 선택자 = HTML 태그명 */
		body{}
		h1{}
		p{}
		span{}
		
		/* 그룹 선택자 = 선택자1, 선택자2 */
		h2, h3{}
		p, ul{}
		/* 아이디 */
		#p1{
		color: red; 
		}
		#p2{
			background-color: blue;
		}
		/* 클래스 */
		.c1{ color: aqua;}
		.c2{ color: fuchsia;}
		/* 하위 선택자*/
		#main h3{
			background-color: olive;
		}
		#intro h3{
			background-color: navy; 
		}
	</style>
</head>
<body>

	<p> 선택자 : 꾸미기 대상
	<p id="p1"> 1. html 태그	=> 	태그명 { }
	<p id="p2"> 2. class	=>	.클래스명 { }
	<p class="c1"> 3. id		=> #id명{  }
	<p class="c2"> 4. * 		=> *{  } : 전체 범위
	<p> 5. 여러개, 	=> 선택자, 선택자2{  } : 여러 선택자 꾸미기
	<p> 6. 하위 선택자 	= div p{   }	: div 태그 안에 모든 p 태그 꾸미기


	<div id="main">
		<h3>
			하위선택자
		</h3>
	</div>
	<div id="intro">
		<h3>
			하위선택자
		</h3>
	</div>
</body>
</html>