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
	
	
	$("#noticeSubmit").on("click", function(e){
		e.preventDefault();
		
		var content = $('#noticeContent').val()
		var title = $('#noticeTitle').val()
		
		
		if(content == "" || content == null){
			alert("내용을 입력 해 주세요.");
			
			return false;
		}
		
		if(title == "" || title == null){
			alert("제목을 입력 해 주세요.");
			
			return false;
		}
		
		$("#notice").submit();
	});

 });

</script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

	<form action="/notice/noticeInsertPro" method="post" enctype="multipart/form-data" id="notice">
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>제목 <input type="text" name="noticeTitle" id="noticeTitle">
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
				<input type="text" name= "noticeWriter" value="관리자" readonly>
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
		</table>


		<div align="center">
			<button class="reset" type="reset"><span>다시작성</span></button>
			<button id="noticeSubmit" class="done" type="submit"><span>작성하기</span></button>
			
		</div>
	</form>
</body>
</html>