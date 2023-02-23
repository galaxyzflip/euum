<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<style>
#detail {

	width: 700px;
	margin: auto;
}

#detail td {
	float: left;
}

#detail tr {
	border-bottom: 1px solid #dadada
}

thead {
	font-weight: bold;
}

#sBtn3 {
	display: block;
	float: left;
	background-color: #818181;
	font-size: 14px;
	letter-spacing: -1px;
	line-height: 34px;
	height: 34px;
	width: 108px;
	text-align: center;
	overflow: hidden;
}

thead td{
	padding:5px;
}


</style>

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

<script>
	$(document).ready(function() {
		var str = $("#textarea").val();
		/* alert(str); */
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
		$("#content").html(str);
	});
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br />
	<br />
	<br />
	<br />


	<div class="main">
		<table id="detail">
			<thead>
				<tr>
					<td><input type="hidden" value="${detail.noticeNum }" /></td>
				</tr>

				<tr>
					<td><c:out value="${detail.noticeTitle }" /></td>
				</tr>

			</thead>

			<tbody>
				<tr>
					<td>등록일 :</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${detail.noticeRegdate}" /> &nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;</td>


					<td>작성자 :</td>
					<td><c:out value="${detail.noticeWriter }" /></td>
				</tr>

				<tr>
					<td style="padding-top:50px; padding-bottom:50px;">
						<div>
							<span id="content"></span>
							${detail.noticeContent }
						</div>

						<div>
							<!-- 이미지 리스트 -->
							<c:forEach items="${image}" var="row">
								<img
									src="/resources/img/${row.imageUploadPath}${row.imageFileName}"
									width=350; height=350;>
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td><c:if test="${loginUser.memberClass eq 'A' }">
							<button data-oper='modify' id="sBtn3">수정</button>
						</c:if>
						<button data-oper='list' id="sBtn3">목록</button></td>
				</tr>
			</tbody>
		</table>

		<form id="operForm" action="/notice/noticeModifyForm" method="get">
			<input type="hidden" id="noticeNum" name="noticeNum"
				value='<c:out value="${detail.noticeNum }"/>'> <input
				type="hidden" id="pageNum" name="pageNum"
				value='<c:out value="${cri.pageNum }"/>'> <input
				type="hidden" id="amount" name="amount"
				value='<c:out value="${cri.amount }"/>'>
		</form>

	</div>

</body>
</html>