<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<style>
#detail{
	margin: auto;
}

#detail td{
	float: left;
	
}

#detail tr{
border-bottom:1px solid #dadada
}

thead{
	font-weight:bold;
}



</style>

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
	/* 줄바꿈 */
</script>

<script>
	$(document).ready(function() {
		var str = $("#textarea").val();
		alert(str);
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
		$("#content").html(str);
	});
</script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="main">
		<form>
			<table id="detail">
			
				<td><input type="hidden" value="${detail.noticeNum }" /></td>
				
			<thead>
				<td><c:out value="${detail.noticeTitle }" /></td>
			</thead>
				<tr />
	
				<td>등록일 :</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${detail.noticeRegdate}" /> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;    
				</td>
				

				<td>작성자 :</td>
				<td><c:out value="${detail.noticeWriter }" /></td>
				<tr /><br/><br/><br/><br/>

				
				<td>
					<div>
						<span id="content"></span> 
						<textarea id="textarea" style="display: none;">${detail.noticeContent }</textarea> 
					</div>
				
					<div>
					<!--  이미지 리스트 -->
						<c:forEach items="${image}" var="row">
							<img src="/resources/img/${row.imageUploadPath}${row.imageFileName}" width=350; height=350;>
						</c:forEach>
					</div>
				</td>
				<tr />
			</table>
		</form>

		<form id="operForm" action="/notice/noticeModifyForm" method="get">
			<input type="hidden" id="noticeNum" name="noticeNum" value='<c:out value="${detail.noticeNum }"/>'> 
			<input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum }"/>'> 
			<input type="hidden" id="amount" name="amount" value='<c:out value="${cri.amount }"/>'>
		</form>
		
	
			<c:if test="${loginUser.memberClass eq 'A' }">
				<button data-oper='modify'>수정</button>
			</c:if>
			<button data-oper='list' id="sBtn3">목록</button>
		


		<%-- <a href='/notice/noticeModifyForm?noticeNum=<c:out value="${detail.noticeNum}"/>'>
	<input type="button" value="글 수정"></a>
	<td>
		<a class='move' href='<c:out value="${detail.noticeNum}"/>'>
		<input type="button" value="글 목록"></a>
	</td> --%>
	</div>

</body>
</html>