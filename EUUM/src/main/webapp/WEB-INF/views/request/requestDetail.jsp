<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/request/requestModifyForm").submit();

		});
		
		$("button[data-oper='list']").on("click", function(e) {
			
			operForm.find("#requestNum").remove();
			operForm.attr("action", "/request/requestList")
			operForm.submit();

		});
	});
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/>

<div>
	<table align="center" width="1000">
		
		<tr>
			<th><c:out value="${detail.requestStatus }"/></th>
			<th><c:out value="${detail.requestTitle }"/></th>
			<th><c:out value="${detail.requestCategory }"/>/<c:out value="${detail.requestUse }"/></th>
		</tr>
		<tr>
			<th>접수 마감일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${detail.requestDead }"/></th>
			<th>작업 마감일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${detail.requestFinish }"/></th>
			<th>예산 : <c:out value="${detail.requestMoney }"/></th>
		</tr>
		
		<tr>
			<th><c:out value="${detail.requestContent }"/></th>
		</tr>
	</table>	
	
	<div>
		<form id="operForm" action="/request/requestModifyForm" method="get">
			<input type='hidden' name='rqpageNum' value='${rqcri.rqpageNum}'>
			<input type='hidden' name='rqamount' value='${rqcri.rqamount}'>
		<%-- 	<input type='hidden' name='rqtype' value='<c:out value="${ rqpageMaker.rqcri.rqtype }"/>'> 
			<input type='hidden' name='rqkeyword' value='<c:out value="${ rqpageMaker.rqcri.rqkeyword }"/>'> --%>
		</form>
		
		<button data-oper='modify'>수정</button>
		<button data-oper='list'>목록</button>
	
	</div>	
</div>
</body>
</html>