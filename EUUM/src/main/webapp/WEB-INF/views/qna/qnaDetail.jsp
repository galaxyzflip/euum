<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<style>
#main{
  margin-left: 400px;
  width: 900px;
}
.table{
   width: 300px;
   height: 300px;
}
.qnaImage{
  width:270px; 
  height:250px;
  margin-left:0px;
}
h1, h6{
  font-family:맑음 고딕;
  margin-left:0px;
}
#detailButton{
  float:right;
  margin-left:528px;
}
#qnaAllBtn{
  display: inline-block;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

</head>
<body>
<br/><br/><br/><br/><br/>

<div id="main">
<form id="frm" method="post"> 
<div id="detail">
<h1>고객 문의</h1>
<h6>상담 업무 시간 : AM 10시 ~ PM 5시 / 점심 12 ~ 1시. 토, 일, 공휴일 휴무</h6>
<br>
<h2>${detail.qnaTitle }</h2>
<table class="table table-sm">
		<colgroup>
			<col width="10%"/>
		    <col width="0%"/>
		    <col width="10%"/>
			<col width="18%"/> 
		</colgroup>
		<tbody>
			<tr style="height:20px;" >
				<th scope="row">작성자</th>
				<td>${detail.qnaWriter }</td>
				<th scope="row">작성일</th>
				<td><fmt:formatDate value="${detail.qnaRegdate }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
             
            <td colspan="5" height="500;">
            <!--  이미지 리스트 -->
             <br>
             <c:forEach items="${image}" var="row">
             <img src="/resources/img/${row.imageUploadPath}${row.imageFileName}" class="qnaImage">        
             </c:forEach>
             		
		    <p><pre><c:out value="${detail.qnaContent}"/></pre></p>
			
			</td>	
			</tr>
		</tbody>
	</table>

   
</div>

<div id="qnaAllBtn">
<button type="button" class="btn btn-primary" onclick="location.href='/qna/List';">목록으로</button>

<input type="hidden" name="qnaNum" value="${detail.qnaNum }"/>


<div id="detailButton" >
<button type="button" class="btn btn-primary"  onclick="location.href='/qna/rewriteForm?qnaNum=${detail.qnaNum}';">답변하기</button>

<c:if test="${detail.memberNum eq memberNum && memberNum != null}">
<button type="submit" class="btn btn-primary" onclick="javascript: form.action='/qna/modifyForm';">수정하기</button>
<button type="submit" class="btn btn-primary" onclick="javascript: form.action='/qna/Delete';">삭제하기</button>
</c:if>

</div>

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