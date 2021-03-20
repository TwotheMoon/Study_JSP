<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	table, tr , th {
		border: solid 2px orange;
		padding: 10px; 
	}
	td{
		border: dotted 2px blue;
		padding: 10px;
	}
	img{
	 	width: 40px	
	}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2> CSS란? </h2><br>
	<table>
		<tr>
			<th rowspan="2">지역</th>
			<th colspan="2">12일(목)</th>
			<th colspan="2">14d일(금)</th>
			<th colspan="2"> 15일(토)</th>
			<th colspan="2">16일(일)</th>
		</tr>
		<tr>
			<th>오전</th>
			<th>오후</th>
			<th>오전</th>
			<th>오후</th>
			<th>오전</th>
			<th>오후</th>
			<th>오전</th>
			<th>오후</th>
		</tr>
		<tr>
			<td>서울<br>경기도<br>인천<br></td>
			<td><img src="img/sunny.png"></td>
			<td><img src="img/sunny.png"></td>
			<td><img src="img/sunny.png"></td>
			<td><img src="img/sunny.png"></td>
			<td><img src="img/sunny.png"></td>
			<td><img src="img/sunny.png"></td>
			<td><img src="img/sunny.png"></td>
			<td><img src="img/sunny.png"></td>
		</tr>
		<tr>
			<td>대전<br>세종<br>충남<br></td>
			<td><img src="img/raining_sun.png"></td>
			<td><img src="img/raining_sun.png"></td>
			<td><img src="img/raining_sun.png"></td>
			<td><img src="img/raining_sun.png"></td>
			<td><img src="img/raining_sun.png"></td>
			<td><img src="img/raining_sun.png"></td>
			<td><img src="img/raining_sun.png"></td>
			<td><img src="img/raining_sun.png"></td>
		</tr>
		<tr>
			<td>부산<br>울산<br>경상남도<br></td>
			<td><img src="img/raining.png"></td>
			<td><img src="img/raining.png"></td>
			<td><img src="img/raining.png"></td>
			<td><img src="img/raining.png"></td>
			<td><img src="img/raining.png"></td>
			<td><img src="img/raining.png"></td>
			<td><img src="img/raining.png"></td>
			<td><img src="img/raining.png"></td>
		</tr>
	</table>
</body>
</html>