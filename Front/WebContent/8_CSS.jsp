<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

	body{
		background-image: url("img/patten.jpg");
		background-repeat: no-repeat;
		background-position: right top;
	
	}
	p{
		width: 400px;
		line-height: 150%;
	
	}
	table{
		border-collapse: collapse;	/* 단일 테두리 만들기 */
	}
	table,th,td{
		border: solid 1px #cccccc;
	}
	table{
		border-top: solid 3px orange;
	}
	th{
		padding: 10px;
		background-color: #eeeeee; 
	}
	td{
		padding: 10px;
		text-align: center;
	}
	#col1 , #col2 ,#col3{
		width: 100px;
	}
	#col4{
		width: 250px;
	}
	.bold{
		font-weight: bold;
	}

</style>

</head>
<body>
	
	<p> CSS 활용 
	<p> 1. 배경이미지 삽입
		<p> 사진이 작을경우 자동으로 채우기
	
	<p> 2. 테이블 꾸미기
	
		<h3> 놀이공원 이용권 </h3>
	<table>
		<tr>
			<th id="col1">종류</th><th id="col2">대인</th><th id="col3">소인</th><th id="col4">비고</th>
		</tr>
		<tr>
			<td class="bold">주간권</td><td>20,000</td><td>10,000원</td>
			<td rowspan="3"> 공원 입장 및 놀이시설 이용(일부 놀이기구 별도 요금)</td>
		</tr>
		<tr>
			<td class="bold">야간권</td><td>20,000</td><td>10,000원</td>
		
		</tr>
		<tr>
			<td class="bold">2일권</td><td>20,000</td><td>10,000원</td>
		
		</tr>
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>