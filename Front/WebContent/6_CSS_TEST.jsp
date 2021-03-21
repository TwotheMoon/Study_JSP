<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	
	.Title_box{
		display: flex;
	
	}
	.Title_box_icon{
		width: 10px;
		height: 25px;
		background-color: green;
		margin-right: 20px;
		margin-top: 23px;
	}
	.Contents{
		background-color: #eeeeee;
		padding: 30px 5px;
		border-radius: 15px;
		border: solid 1px #aaaaaa;
	}
	.Bottom-contents{
		margin: 20px 0px 0px 20px;
		border: solid 2px gray;
		border-radius: 15px;
		width: 300px;
		height: 300px;
		
	}
	.Bottom-contents_head{
		display: flex;
		justify-content: flex-start;
		margin: 30px 30px;
	}
	.Bottom-contents_head_icon{
		width: 10px;
		height: 25px;
		background-color: green;
		margin-right: 20px;
		margin-top: 23px;
	}
	.Bottom-contents_text{
		margin: 20px 30px;
	}
	.Bottom-contents_link{
		text-align: right;
		margin-top: 20px;
	}
	.Bottom-contents_link > a{
		text-decoration: none;
		margin-right: 30px;
		font-weight: bold;
		color: tomato;
	}
</style>
</head>
<body>
	<div class="Title_box">
		<div class="Title_box_icon"></div>
		<div>
			<h2> 우대정보 </h2>
		</div>
	</div>
	<div class="Contents">
		<div class="Contents_con">
			<ul>
				<li>
					연령에 따른 우대(나이 확인이 가능한 신분증 또는 서류 제시)<br>
					 -경로 : 만 65세~ <br>
					 -청소년 : 만 13세 ~ 만 18세
				</li><br>
				<li>
					장애인 우대 (장애인증록증 제시) 우대가격<br>
					 -1일 이용권 우대가로 구입가능<br>
					 -장애의 정도가 심한 장애인 : 본인+동반 1인
				</li><br>
				<li>
					국가유공자 우대 (증명서류 제시) 파크 이용권 가격 보기<br>
					 -본인 + 동반 1인, 1일 이용권 50% 우대가로 구입가능
				</li>
			</ul>
		</div>
	</div>
	<div class="Bottom-contents">
		<div class="Bottom-contents_head">
			<div class="Bottom-contents_head_icon"></div>
			<div class="Bottom-contents_head_text"><h2>HTML/CSS강좌</h2></div>
		</div>
		<div class="Bottom-contents_text">HTML/CSS를 이용하면 텍스트, 이미지, 비디오, 오디오 등으로 홈페이지를 제작할 수 있어요.^^</div>
		<div class="Bottom-contents_link"><a href="#"> 바로가기>></a></div>
	</div>
</body>
</html>