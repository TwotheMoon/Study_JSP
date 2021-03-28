<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	form , h3{
		width : 500px;
		margin: 0px auto;
	}
	table{
		border-top: solid 1px #eeeeee;
		border-bottom: solid 1px #eeeeee;
		padding: 10px 0px;
		margin-bottom: 20px;
		width: 600px;
		height: 350px;
	}
	td{
		display: inline-block;
	}
	.filed-name{
		width: 130px;
		margin-left: 20px;
	}
	.buttons{
		width: 400px;
		text-align: right;
	}
	.email-box{
		width: 80px;
	}
	textarea {
	width: 250px;
	height: 100px;
	}
	.hello{
		vertical-align: top;	
	}
	.buttons input{
		padding: 10px 20px;
	}

</style>
</head>
<body>
<%@include file="9_CSS_menu.jsp" %>
	<h3> 회원가입 폼 </h3>
<form>	
	<table>
		<tr>
			<td class="filed-name"> 아이디 </td>
			<td> <input type="text"> </td>
		</tr>
		<tr>
			<td class="filed-name"> 비밀번호 </td>
			<td> <input type="password"> </td>
		</tr>
		<tr>
			<td class="filed-name"> 비밀번호 확인 </td>
			<td> <input type="password"> </td>
		</tr>
		<tr>
			<td class="filed-name"> 이름 </td>
			<td> <input type="text"> </td>
		</tr>
		<tr>
			<td class="filed-name"> 이메일 </td>
			<td> <input class="email-box" type="text">@
				<select>
					<option>직접 입력</option>
					<option>naver.com</option>
					<option>gmail.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="filed-name"> 이메일 수신 </td>
			<td> <input type="radio" name="email" checked="checked" >비수신</td>
			<td> <input type="radio" name="email">수신</td>
		</tr>
		<tr>
			<td class="filed-name"> 가입 경로 </td>
			<td> <input type="checkbox" name="route1"> 친구추천 </td>
			<td> <input type="checkbox" name="route1"> 인터넷검색 </td>
			<td> <input type="checkbox" name="route1" checked="checked"> 기타 </td>
		</tr>
		<tr>
			<td class="filed-name hello">인사말</td>
			<td><textarea></textarea> </td>
		</tr>
	</table>
	<div class="buttons">
		<input type="submit" value="저장하기">
		<input type="reset" value="취소하기">
	</div>
</form>
</body>
</html>