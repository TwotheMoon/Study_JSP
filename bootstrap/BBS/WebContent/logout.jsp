<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%session.invalidate(); // 세션 죽임 %> 

	<script type="text/javascript">
		
		alert("로그아웃");
		location.href = "main.jsp";	
	
	</script>

</body>
</html>