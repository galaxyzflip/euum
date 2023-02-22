<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
<!DOCTYPE html>
<html>
<head>
<!-- 달력 -->
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
				<td>제목 <input type="text" name="requestTitle">
				</td>
				
				
				<td><label for="category">카테고리 선택</label>
				<input type="hidden" id="category"/>
					<select id="changeCategory" name="requestCategory">
						<option value="">선택하세요</option>
						<option value="일러스트">일러스트</option>
						<option value="디자인">디자인</option>
						<option value="???">뭔가는</option>
						<option value="?????">있겠지</option>
					</select>
				</td>
				
				<td><label for="category">용도 선택</label>
				<input type="hidden" id="use"/>
					<select id="changeCategory2" name="requestUse">
						<option value="">선택하세요</option>
						<option value="1">방송용</option>
						<option value="2">상업용</option>
						<option value="3">비상업용</option>
					</select>
				</td>
			</tr>
				
			<tr>	
				<td>작성자
				<input type="text" name= "requestWriter" value="${loginUser.memberEmail }" readonly>
				</td>
			</tr>
			

			

			<tr>
				<td><textarea placeholder="입력하세요" name="requestContent"></textarea></td>
			</tr>
			<tr>
				<td><input type="text" name="requestMoney" placeholder="예)협의, 10만원 내외 ">
			</td>	
			
			<tr>
				<td>
				접수마감일 <input type="date" name="requestFinish">
				</td>
			</tr>	
			
			<tr>
				<td>
				작업완료기한 <input type="date" name="requestDead">
				</td>
			</tr>
		
		</table>


		<div align="center">
			<button class="reset" type="reset"><span>다시작성</span></button>
			<button class="done" type="submit"><span>작성하기</span></button>
			
		</div>
	</form>
</body>
</html>