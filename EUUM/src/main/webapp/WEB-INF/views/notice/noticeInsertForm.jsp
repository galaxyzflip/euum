<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
$(document).ready(function(){
	$("#changeCategory").change(function(){
		$("#category").val($(this).val());
	});	
	
	
	$("#noticeSubmit").on("click", function(e){
		e.preventDefault();
		
		var content = $('#noticeContent').val()
		var title = $('#noticeTitle').val()
		
		
		if(content == "" || content == null){
			alert("����� �Է� �� �ּ���.");
			
			return false;
		}
		
		if(title == "" || title == null){
			alert("���� �Է� �� �ּ���.");
			
			return false;
		}
		
		$("#notice").submit();
	});

	
	
 });


</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

	<form action="/notice/noticeInsertPro" method="post" enctype="multipart/form-data" id="notice">
		<table style="margin: auto;" >
			<tr>

				<td>제목 <input type="text" name="noticeTitle">

				</td>
				
				
				<td><label for="category">카테고리 선택</label>
				<input type="hidden" id="category"/>
					<select id="changeCategory" name="noticeCategory">
							<option value="1">공지사항</option>
							<option value="2">의뢰인FAQ</option>
							<option value="3">전문가FAQ</option>
					</select>
				</td>
			</tr>
				
			<tr>	

				<td>작성자
				<input type="text" name= "noticeWriter" value="${sessionScope.loginUser.memberName }" readonly>

				</td>
			</tr>
			
			<tr><td>
            <input type="file" name="uploadFile">
		    <input type="file" name="uploadFile">
		    <input type="file" name="uploadFile">  
			</td></tr>

			<tr>

				<td><textarea placeholder="입력하세요" name="noticeContent" id="noticeContent"></textarea></td>

			</tr>
		</form>
		
		<div align="center">

			<tr>
				<td>

			<button class="reset" type="reset"><span>다시작성</span></button>
			<button class="done" type="submit"><span>작성하기</span></button>

				</td>
			</tr>		
		</div>
	</table>
</body>
</html>