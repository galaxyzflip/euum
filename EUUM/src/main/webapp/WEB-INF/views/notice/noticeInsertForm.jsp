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

	<form action="/notice/noticeInsertPro" method="post" enctype="multipart/form-data">
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
			
			<tr><td>
            <input type="file" name="uploadFile">
		    <input type="file" name="uploadFile">
		    <input type="file" name="uploadFile">  
			</td></tr>

			<tr>
				<td><textarea placeholder="�Է��ϼ���" name="noticeContent"></textarea></td>
			</tr>
		</table>


		<div align="center">
			<button class="reset" type="reset"><span>�ٽ��ۼ�</span></button>
			<button class="done" type="submit"><span>�ۼ��ϱ�</span></button>
			
		</div>
	</form>
</body>
</html>