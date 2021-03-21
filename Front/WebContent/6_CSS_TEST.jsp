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
			<h2> ������� </h2>
		</div>
	</div>
	<div class="Contents">
		<div class="Contents_con">
			<ul>
				<li>
					���ɿ� ���� ���(���� Ȯ���� ������ �ź��� �Ǵ� ���� ����)<br>
					 -��� : �� 65��~ <br>
					 -û�ҳ� : �� 13�� ~ �� 18��
				</li><br>
				<li>
					����� ��� (����������� ����) ��밡��<br>
					 -1�� �̿�� ��밡�� ���԰���<br>
					 -����� ������ ���� ����� : ����+���� 1��
				</li><br>
				<li>
					���������� ��� (������ ����) ��ũ �̿�� ���� ����<br>
					 -���� + ���� 1��, 1�� �̿�� 50% ��밡�� ���԰���
				</li>
			</ul>
		</div>
	</div>
	<div class="Bottom-contents">
		<div class="Bottom-contents_head">
			<div class="Bottom-contents_head_icon"></div>
			<div class="Bottom-contents_head_text"><h2>HTML/CSS����</h2></div>
		</div>
		<div class="Bottom-contents_text">HTML/CSS�� �̿��ϸ� �ؽ�Ʈ, �̹���, ����, ����� ������ Ȩ�������� ������ �� �־��.^^</div>
		<div class="Bottom-contents_link"><a href="#"> �ٷΰ���>></a></div>
	</div>
</body>
</html>