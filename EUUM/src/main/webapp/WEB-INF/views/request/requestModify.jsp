<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>         
<!DOCTYPE html>
<html>
<head>

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

<script type="text/javascript">
function modify(){
	
	var requestModify=$("#requestModify").serialize();
		alert(requestModify);
		$.ajax({
			type : "POST",
			url : "<c:url value='/request/requestModifyPro'/>",
			data : requestModify,
			async: false,
			success : function(data){
				
				location.href="<c:url value='/request/requestList'/>"; 	        		
		}
			
	});

		
 }

function deletee(){
	
	var requestDelete=$("#requestModify").serialize();
		alert(requestDelete);
		$.ajax({
			type : "POST",
			url : "<c:url value='/request/requestDelete'/>",
			data : requestDelete,
			async: false,
			success : function(data){
				
				
				location.href="<c:url value='/request/requestList'/>"; 	        
				
		}
	});
		
 }
 
function list(){
	
	var operForm=$("#operForm").serialize();
		alert(operForm);
		$.ajax({
			type : "GET",
			url : "<c:url value='/request/requestList'/>",
			data : operForm,
			async: false,
			success : function(data){
				
				
				location.href="<c:url value='/request/requestList'/>"; 	        
				
		}
	});
		
 }
	

</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/>
<div>
	<form id="requestModify">
		<input type="hidden" name="memberNum" value="${requestModify.memberNum }">
		<input type="hidden" name="requestNum" value="${requestModify.requestNum }">
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>제목 :
					<input type="text" name="requestTitle" value="${requestModify.requestTitle } ">
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
				<input type="hidden" id="use" />
					<select id="changeCategory2" name="requestUse">
						<option value="">선택하세요</option>
						<option value="방송용">방송용</option>
						<option value="상업용">상업용</option>
						<option value="비상업용">비상업용</option>
					</select>
				</td>
			</tr>
				
			<tr>	
				<td>작성자
				<input type="text" name= "requestWriter" value="용주" readonly>
				</td>
			</tr>
			
	
			
	
			<tr>
				<td><textarea name="requestContent">${requestModify.requestContent }</textarea></td>
			</tr>
			<tr>
				<td><input type="text" name="requestMoney" value="${requestModify.requestMoney }">
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
	</form>
		
	<form id="operForm">
		<input type="hidden" id="requestNum" value='<c:out value="${requestModify.requestNum }"/>'>
		<input type="hidden" id="rqpageNum" value='<c:out value="${rqcri.rqpageNum }"/>'>
		<input type="hidden" id="rqamount" value='<c:out value="${rqcri.rqamount }"/>'>
	</form>
	
		
	<div align="center">
		<button type="button" onclick="modify()">수정</button>
		<button type="button" onclick="deletee()">삭제</button>
		<button type="button" onclick="list()">목록</button>
	</div>	
</div>			
	
</body>
</html>