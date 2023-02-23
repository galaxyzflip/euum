<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	var form = $('#frm')[0];
    var formData = new FormData(form);
	
	var noticeModify=$("#frm").serialize();
		alert(noticeModify);
		$.ajax({
			type : "POST",
			url : "<c:url value='/notice/noticeModifyPro'/>",
			processData : false,
	        contentType : false,
			data : formData,
			async: false,
			success : function(data){
				
  			location.href="<c:url value='/notice/notice'/>"; 	        		
		},
		error : function(error) {
		
			alert("실패");
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


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/><br/>
	<div>
	<form id="frm" enctype="multipart/form-data">
		<table align="center">
			<tr>
	
				<input type="hidden" name="noticeNum" value="${modify.noticeNum }"/>
				<td>��紐�</td>
				<td><input type="text" name="noticeTitle" value="${modify.noticeTitle }"/></td>
				<tr>
				<td><label for="category">移댄��怨�由� ����</label>
					<input type="hidden" id="category"/>
						<select id="changeCategory" name="noticeCategory">
								<option value="1">怨듭��ы��</option>
								<option value="2">��猶곗��FAQ</option>
								<option value="3">��臾멸�FAQ</option>
						</select>
				</td>
				</tr>
			<tr>
				<td>���깆��</td>
				<td><input type="text" value="${modify.noticeWriter }" readonly="readonly"/>
				</td>
			</tr>
								
				<td>�댁��</td>
				<td><textarea name="noticeContent">${modify.noticeContent }</textarea></td>
				
				<!-- 이미지 리스트 -->
	            <td> 
	           <c:forEach items="${image}" var="row">
	          <img src="/resources/img/${row.imageUploadPath}${row.imageFileName}" width=350; height=350;>     
	   
	          </c:forEach>	      
	              <input type="file" name="uploadFile" id="uploadFile">
	              <input type="file" name="uploadFile" id="uploadFile">
	              <input type="file" name="uploadFile" id="uploadFile">
				</td> 
			
		
		</tr>
		</table>
			</form>	
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