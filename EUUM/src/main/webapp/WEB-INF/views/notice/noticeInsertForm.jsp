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
				<input type="text" name= "noticeWriter" value="용주" readonly>
				</td>
			</tr>
			

			

			<tr>
				<td><textarea placeholder="입력하세요" name="noticeContent"></textarea></td>
			</tr>
		</table>


		<div align="center">
			<input type="submit" value="작성완료"> <input type="button" value="취소">
		</div>
	</form>
</body>
</html>