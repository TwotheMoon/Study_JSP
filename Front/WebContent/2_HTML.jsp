<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<p> �� : form
	<p> 1. input : �Է� ���
	<p> 2. select : ���� �ڽ�
	<p> 3. textarea : ������ �Է�
	
	<form>
		�̸�[text : ���ֱ�] : <input type="text" value="�̴���"> <br>
		�̸�[text : �б���] : <input type="text" value="�̴���" readonly="readonly"> <br>
		�̸�[text : �Է¿���] : <input type="text" placeholder="�����Է�" > <br>
		�̸�[text : ���Ұ�] : <input type="text" placeholder="�����Է�" disabled="disabled"> <br>
		
		��й�ȣ[password : ��Ŀ��] : <input type="password" autofocus="autofocus"> <br>
		
		�̸��� ����[radio] : <input type="radio" name="email" checked="checked">��
						  <input type="radio" name="email">�ƴϿ� <br> 
		
		�о�[checkbox] : <input type="checkbox" name="item1"> ����
						<input type="checkbox" name="item2"> ���
						<input type="checkbox" name="item3"> ������
						<input type="checkbox" name="item4"> ����
						<input type="checkbox" name="item5"> ��Ÿ <br><br>
		
		����[file] : <input type="file"> <br><br>
		
		��ư[input] : <input type="submit" value="������">
		��ư[] : <input type="button" value="�ߺ�Ȯ��">
		��ư[] : <input type="reset" value="�ٽ��ۼ�"> <br><br>
		
		��ư[button] : <button type="submit">������</button>
		��ư[] : <button type="button">�ߺ�Ȯ��</button>
		��ư[] : <button type="reset">�ٽ��ۼ�</button> <br><br>
		
		�̸��� : <input type="email"> <br><br>
		
		�̸��� : <input type="text" >@ 
		<select>
			<option>naver.com</option>
			<option>gmail.com</option>
			<option>hanmail.net</option>
		</select><br><br>
		
		���� : <textarea rows="6" cols="80"></textarea>
	</form>
	
	<p> ���̺� �±�
	<p> 1. tr : �� �߰�
	<p> 2. td : ������ �Է�
	<p> 3. th : �� ����	
	<p> 4. border : �׵θ� ��
	<p> 5. colspan : �� ����
	<table border="1" style="border-color: tomato;">
		<tr>
			<th>����</th><th colspan="2">�������/�ְ���</th>
		</tr>	
		<tr>
			<td rowspan="2">����</td><td>20</td><td>30</td>
		</tr>
		<tr>
			<td>2</td><td>21</td>
		</tr>
		
		<tr>
			<td rowspan="2">�뱸</td><td>32</td><td>85</td>
		</tr>
		
		<tr>
			<td>15</td><td>25</td>
		</tr>
		
		
	</table>

</body>
</html>