<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<script type="text/javascript">
function modify(){
	
	var noticeModify=$("#frm").serialize();
		alert(noticeModify);
		$.ajax({
			type : "POST",
			url : "<c:url value='/notice/noticeModifyPro'/>",
			data : noticeModify,
			async: false,
			success : function(data){
				
				location.href="<c:url value='/notice/notice'/>"; 	        		
		}
			
	});

		
 }

function deletee(){
	
	var noticeModify=$("#frm").serialize();
		alert(noticeModify);
		$.ajax({
			type : "POST",
			url : "<c:url value='/notice/noticeDelete'/>",
			data : noticeModify,
			async: false,
			success : function(data){
				
				
				location.href="<c:url value='/notice/notice'/>"; 	        
				
		}
	});
		
 }
	

</script>


<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/><br/>
	<div>
		<table align="center">
			<tr>
			<form id="frm">
				<input type="hidden" name="noticeNum" value="${modify.noticeNum }">
				<td>제목</td>
				<td><input type="text" name="noticeTitle" value="${modify.noticeTitle }"/>
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
				
				<td>작성자</td>
				<td><input type="text" value="${modify.noticeWriter }" readonly="readonly"/>
				</td></tr>
								
				<td>내용</td>
				<td><textarea name="noticeContent">${modify.noticeContent }</textarea>
				</td>
			</form>	
			</tr>
		</table>
	</div>
	
	<form id="operForm" action="/notice/noticeModifyForm" method="get">
		<input type="hidden" id="noticeNum" value='<c:out value="${detail.noticeNum }"/>'>
		<input type="hidden" id="pageNum" value='<c:out value="${cri.pageNum }"/>'>
		<input type="hidden" id="amount" value='<c:out value="${cri.amount }"/>'>
	</form>
		
	<div align="center">
		<button type="button" onclick="modify()">수정</button>
		<button type="button" onclick="deletee()">삭제</button>
	</div>	
	


</body>
</html>