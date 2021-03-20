<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
	table , tr , th , td{
		border: dotted 2px tomato;
		text-align: center;
		border-collapse: collapse;
		padding: 10px;
	}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3> KTX 열차 시간표 </h3>
		<table>
			<tr>
				<th>출발</th><th>도착</th><th colspan="2">객실/요금</th><th>예약</th>
			</tr>
			<tr>
				<td>서울(09:00)</td><td>부산(12:00)</td><td>일반실</td><td>50,000</td><td><button>예약신청</button></td>
			</tr>
			<tr>
				<td>서울(10:00)</td><td>부산(13:00)</td><td>특실</td><td>80,000</td><td><button>예약불가</button></td>
			</tr>
			<tr>
				<td>서울(11:00)</td><td>부산(14:00)</td><td>특실</td><td>80,000</td><td><button>예약신청</button></td>
			</tr>
		</table>


</body>
</html>