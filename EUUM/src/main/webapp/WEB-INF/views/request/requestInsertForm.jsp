<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
<!DOCTYPE html>
<html>
<head>
<!-- �޷� -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
$(document).ready(function(){
	
	
	$("#changeCategory").change(function(){
		$("#category").val($(this).val());
	alert($(this).val())
	});	
	
	$("#changeCategory2").change(function(){
		$("#use").val($(this).val());
		alert($(this).val())
	});	
 });
 
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/>
<form action="/request/requestInsertPro" method="post">
	<input type="hidden" name="memberNum" value="1">
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>���� <input type="text" name="requestTitle">
				</td>
				
				
				<td><label for="category">ī�װ� ����</label>
				<input type="hidden" id="category"/>
					<select id="changeCategory" name="requestCategory">
						<option value="">�����ϼ���</option>
						<option value="�Ϸ���Ʈ">�Ϸ���Ʈ</option>
						<option value="������">������</option>
						<option value="???">������</option>
						<option value="?????">�ְ���</option>
					</select>
				</td>
				
				<td><label for="category">�뵵 ����</label>
				<input type="hidden" id="use"/>
					<select id="changeCategory2" name="requestUse">
						<option value="">�����ϼ���</option>
						<option value="1">��ۿ�</option>
						<option value="2">�����</option>
						<option value="3">������</option>
					</select>
				</td>
			</tr>
				
			<tr>	
				<td>�ۼ���
				<input type="text" name= "requestWriter" value="${loginUser.memberEmail }" readonly>
				</td>
			</tr>
			

			

			<tr>
				<td><textarea placeholder="�Է��ϼ���" name="requestContent"></textarea></td>
			</tr>
			<tr>
				<td><input type="text" name="requestMoney" placeholder="��)����, 10���� ���� ">
			</td>	
			
			<tr>
				<td>
				���������� <input type="date" name="requestFinish">
				</td>
			</tr>	
			
			<tr>
				<td>
				�۾��Ϸ���� <input type="date" name="requestDead">
				</td>
			</tr>
		
		</table>


		<div align="center">
			<button class="reset" type="reset"><span>�ٽ��ۼ�</span></button>
			<button class="done" type="submit"><span>�ۼ��ϱ�</span></button>
			
		</div>
	</form>
</body>
</html>