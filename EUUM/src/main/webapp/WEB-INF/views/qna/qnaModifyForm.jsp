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


<div id="main">
<form role="form" action="/qna/modifyPro" method="post" enctype="multipart/form-data">
<div id="detail">

<p>수정하기</p>
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
				<td><input type="text" class="form-control" name="qnaTitle" value="${detail.qnaTitle}"></td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${detail.qnaWriter }</td>
				<th scope="row">작성일</th>
				<td>${detail.qnaRegdate } </td>
			</tr>
			<tr>
		         <td colspan="4">
		        
		        <!--  이미지 리스트 -->
		        <div id="qnaImage" >
	             <c:forEach items="${image}" var="row">
	             <img src="/resources/img/${row.imageUploadPath}${row.imageFileName}" width=350; height=350;>        
	             </c:forEach>
	             
	             <input type="file" name="uploadFile">
	             <input type="file" name="uploadFile">	
	             <input type="file" name="uploadFile">		
		        </div>
		        
		         <input type="text" class="form-control" name="qnaContent" value="${detail.qnaContent}">
		         </td>             			
			</tr>
			
		</tbody>
	</table>
<input type="hidden" name="qnaNum" value="${detail.qnaNum }"/>
</div>
<button type="button" class="btn btn-primary" onclick="location.href='/qna/List';">목록으로</button>

<div id="detailButton" name="detailButton" align="right">
<button type="submit" class="btn btn-primary" onclick="modify()">수정하기</button>
</div>

</form>


</div>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function modify(){

	
}

</script>
</html>