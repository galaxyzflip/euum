<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script>
$(document).ready(function(){
	$("#changeCategory").change(function(){
		$("#category").val($(this).val());

	});
 });


</script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

	<form action="/notice/noticeInsertPro" method="post">
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>���� <input type="text" name="noticeTitle">
				</td>
				
				
				<td><label for="category">ī�װ� ����</label>
				<input type="hidden" id="category"/>
					<select id="changeCategory" name="noticeCategory">
							<option value="1">��������</option>
							<option value="2">�Ƿ���FAQ</option>
							<option value="3">������FAQ</option>
					</select>
				</td>
			</tr>
				
			<tr>	
				<td>�ۼ���
				<input type="text" name= "noticeWriter" value="����" readonly>
				</td>
			</tr>
			

			

			<tr>
				<td><textarea placeholder="�Է��ϼ���" name="noticeContent"></textarea></td>
			</tr>
		</table>


		<div align="center">
			<input type="submit" value="�ۼ��Ϸ�"> <input type="button" value="���">
		</div>
	</form>
</body>
</html>