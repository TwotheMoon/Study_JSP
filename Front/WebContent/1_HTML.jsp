<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	HTML : ������ �±׾��
	
	1. h1 ~ h6 : �� ���� �±�
	<h1> HTML ���� </h1>
	<h2> HTML ���� </h2>
	<h3> HTML ���� </h3>
	<h4> HTML ���� </h4>
	<h5> HTML ���� </h5>
	<h6> HTML ���� </h6>
	
	2. �ܶ� : p
	<h2> �� ��������? </h2>
	<p> �������ؽ�Ʈ ��ũ�� ���� �� �������� ���� �������� ��ũ�� ����. 
		����, HTML�� ����, �ܶ�, ��� ��� ���� ������ ���� ������ �ǹ̸� ��Ÿ���� �ͻӸ� �ƴ϶� 
		��ũ, �ο�� �� ���� �׸����� ������ ������ ���� �� �ִ� ����� �����Ѵ�. 
	<p>�ֽ� ����: HTML 5.2
		�ֱ� ���� �����: 2017�� 12�� 17��
		�̸����� ���� �����: 2018�� 10�� 18��
		�̸����� ����: HTML 5.3 (�ʾ�)
		������: W3C�� WHATWG
		
	3. �ٹٲ� : br
	<p> �������ؽ�Ʈ ��ũ�� ���� �� �������� ���� �������� ��ũ�� ����. <br>
		����, HTML�� ����, �ܶ�, ��� ��� ���� ������ ���� ������ �ǹ̸� ��Ÿ���� �ͻӸ� �ƴ϶� <br> 
		��ũ, �ο�� �� ���� �׸����� ������ ������ ���� �� �ִ� ����� �����Ѵ�. <br>
	<p>�ֽ� ����: HTML 5.2 <br>
		�ֱ� ���� �����: 2017�� 12�� 17��	<br>
		�̸����� ���� �����: 2018�� 10�� 18�� <br>
		�̸����� ����: HTML 5.3 (�ʾ�) <br>
		������: W3C�� WHATWG <br><br>
	
	4. Ư������ : &��ȣǥ�� 
		<p> &nbsp; &lt; Ư�����ڻ�� &gt; 
		&amp; &quot; &#39;
		�������ؽ�Ʈ ��ũ�� ���� �� �������� ���� �������� ��ũ�� ����. <br>
		����, HTML�� ����, �ܶ�, ��� ��� ���� ������ ���� ������ �ǹ̸� ��Ÿ���� �ͻӸ� �ƴ϶� <br> 
		��ũ, �ο�� �� ���� �׸����� ������ ������ ���� �� �ִ� ����� �����Ѵ�. <br><br>
	
	5. �̹��� : img
	<p> 1. alt : ���� ����
	<p> 2. src : ���� ���
	<p> 3. ũ�� ���� : width : ���α��� // height : ���α���
	<p> 		// �ȼ�[����ũ��] : ��[ �̹����� ǥ���ϴ� �� ] 
				// �ۼ�Ʈ[���ũ��] : ���� ���ũ��<br>
				
	<img alt="" src="img/bg2.jpg" width="300px">
	<img alt="" src="img/bg2.jpg" width="200px" height="200px">
	<img alt="" src="img/bg2.jpg" width="80%">
	<p> ���� ���� : // 1. jpg // 2.png // 3.gif // 4.svg
	
	<p> ���� ��� 
	<p> ��� ��� : ../bg2.jpg
	<p> ���� ��� : ./img/bg2.jpg
	<img alt="" src="./bg2.jpg"> ����x
	<img alt="" src="./img/bg2.jpg">
	<img alt="" src="./img/test/bg2.jpg"> ����x
	<img alt="" src="../img/bg2.jpg"> ����x <br>
	
	6. ����� �±� audio
	<p> // 1. controls = ȭ�鿡 �÷��� ǥ��
		// 2. autoplay = �ڵ�����
	
	<audio controls="controls" src="img/Da Jazz Blues - Doug Maxwell_Media Right Productions.mp3"></audio>
	
	<p> 7. ���� �±� video

	<video controls="controls" width="300px" height="300px" >
		<source src="img/Moon - 59026.mp4" type="video/mp4">
	</video>
	
	<p> // ��Ʃ�� [ �ܺ� ���� ]
	<iframe width="560" height="315" src="https://www.youtube.com/embed/IpDuHHN00mY?controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	
	<p> 8. ����[��ȣ]���� ��� : ul li
		<h2> ���� ������ ��� ���� </h2>
		<ul>
			<li>�λ��� ������</li>
			<li>����ȣ</li>
			<li>���γ��� �ҽ�</li>
			<li>���� �ҽ�</li>
			<li>�ǵ��� ��¡�� 2���� ����</li>
			<li>��õ�� �� ������</li>
		</ul>
	
	<p> 9. ����[��ȣ]�ִ� ��� : ol li
		<h2> ���� ������ ��� ���� </h2>
		<ol>
			<li>�λ��� ������</li>
			<li>����ȣ</li>
			<li>���γ��� �ҽ�</li>
			<li>���� �ҽ�</li>
			<li>�ǵ��� ��¡�� 2���� ����</li>
			<li>��õ�� �� ������</li>
		</ol>
		
		<p> 10. ��ũ : a �±�
		<p> target="_blank" : ��â���� ����
		<ol>
			<li><a href="http://www.naver.com" target="blank">�λ��� ������</a></li>
			<li><a href="http://www.naver.com">����ȣ</a></li>
			<li><a href="http://www.naver.com">���γ��� �ҽ�</a></li>
			<li><a href="http://www.naver.com">���� �ҽ�</a></li>
			<li><a href="http://www.naver.com">�ǵ��� ��¡�� 2���� ����</a></li>
			<li><a href="http://www.naver.com">��õ�� �� ������</a></li>
		</ol>
		
		
</body>
</html>