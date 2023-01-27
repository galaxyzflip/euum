<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>  

<!DOCTYPE html>
<html>
<head>
<style>
.table{
   width: 500px;
   height: 500px;
}


</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

</head>
<body>
<br/><br/><br/><br/><br/>

<div id="main">
<form id="frm" method="post"> <!-- action="/qna/modifyForm" method="post" -->
<div id="detail">

<p>문의 내용</p>
<table class="table table-sm">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${detail.qnaTitle }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${detail.qnaWriter }</td>
				<th scope="row">작성일</th>
				<td>${detail.qnaRegdate } </td>
			</tr>
			<tr>
				<td colspan="4">${detail.qnaContent}</td>
			</tr>
		</tbody>
	</table>

</div>

<button type="button" class="btn btn-primary" onclick="location.href='/qna/List';">목록으로</button>

<input type="hidden" name="qnaNum" value="${detail.qnaNum }"/>

<div id="detailButton" name="detailButton" align="right">
<button type="button" class="btn btn-primary" onclick="location.href='/qna/rewriteForm?qnaNum=${detail.qnaNum}';">답변하기</button>
<button type="submit" class="btn btn-primary" onclick="javascript: form.action='/qna/modifyForm';">수정하기</button>
<button type="submit" class="btn btn-primary" onclick="javascript: form.action='/qna/Delete';">삭제하기</button>
</div>

</form>


</div>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function qnaDelete(){
	
	$.ajax({
	     url : "/qna/Delete",
	     data : $("#frm").serialize(),
	     method: "POST",

	    success : function(result){
			
				location.href="<c:url value='/qna/List'/>"; 	        
				
		}
	});
 } 
function qnaModify(){
	
	$.ajax({
	     url : "/qna/modifyForm",
	     data : $("#frm").serialize(),
	     method: "POST",

	    success : function(result){
		   	
		}
	});
 } 

</script>
</html>