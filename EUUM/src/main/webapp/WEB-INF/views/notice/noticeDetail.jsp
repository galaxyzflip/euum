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

			operForm.attr("action", "/notice/noticeModifyForm").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#noticeNum").remove();
			operForm.attr("action", "/notice/notice")
			operForm.submit();

		});
	});
</script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<div>
	<form>
	<table>
		<td>
			<input type="hidden" value="${detail.noticeNum }"/>
		</td><tr/>
		
		<td>����</td>
		<td>
			<c:out value="${detail.noticeTitle }"/>
		</td>
		<tr/>
		
		<td>�����</td>
		<td>
			<fmt:formatDate pattern="yyyy-MM-dd" value="${detail.noticeRegdate}" />
		</td><tr/>
		
		<td>�ۼ���</td>
		<td>
			<c:out value="${detail.noticeWriter }"/>
		</td><tr/>
		
		<td>����</td>
		<td>
			<c:out value="${detail.noticeContent }"/>
			
			<!--  �̹��� ����Ʈ -->
             <c:forEach items="${image}" var="row">
             <img src="/resources/img/${row.imageUploadPath}${row.imageFileName}" width=350; height=350;>        
             </c:forEach>	
		
		</td><tr/>
	</table>
	</form>
	
	<form id="operForm" action="/notice/noticeModifyForm" method="get">
		<input type="hidden" id="noticeNum" name="noticeNum" value='<c:out value="${detail.noticeNum }"/>'>
		<input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
		<input type="hidden" id="amount" name="amount" value='<c:out value="${cri.amount }"/>'>
	</form>
	
	<button data-oper='modify'>����</button>
	<button data-oper='list'>���</button>
	
	
	
	<%-- <a href='/notice/noticeModifyForm?noticeNum=<c:out value="${detail.noticeNum}"/>'>
	<input type="button" value="�� ����"></a>
	<td>
		<a class='move' href='<c:out value="${detail.noticeNum}"/>'>
		<input type="button" value="�� ���"></a>
	</td> --%>
</div>

</body>
</html>