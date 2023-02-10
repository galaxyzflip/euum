<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<script>	
$(document).ready(function(){
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='requestNum' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/request/requestDetail");
		actionForm.submit();
	});

	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e) {

				e.preventDefault();

				console.log('click');

				actionForm.find("input[name='rqpageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
	
	/* var actionForm1 = $("#actionForm1");
	$('#requestSort').on('change', function(){
		let requestSort = $(this).find('option:selected').val();
		console.log(requestSort);
		$('input[name="requestCategoey"]').val(requestCategoey);
		console.log($('input[name="requestCategoey"]').val());
		alert(requestSort);
		$('#actionForm1').submit();
	}) */
	
	var searchForm = $("#searchForm");

	$("#searchForm button").on("click",function(e) {
		

		if (!searchForm.find("option:selected").val()) {
			alert("검색종류를 선택하세요");
			return false;
			}

			if (!searchForm.find("input[name='rqkeyword']").val()) {
			alert("키워드를 입력하세요");
			return false;
			}

			searchForm.find("input[name='rqpageNum']").val("1");
			e.preventDefault();
			searchForm.submit();

			});
});
</script type="text/javascript">

<script>

function search(){
	var search= document.requestCategoey;
	search.submit();
	return false;
}

</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/>
<div>
	<div class="requestSort">
		<ul>
			<form method="post" action="/request/requestCategoryChange" name="requestCategoey">
	
				<select id="requestSort" name="requestCategoey" onchange="search()">
					<option value="">선택해주세요</option>
					<option value="1"
						${rqpageMaker.rqcri.requestCategoey eq "일러스트" ? 'selected' : ''}>일러스트</option>
					<option value="2"
						${rqpageMaker.rqcri.requestCategoey eq "디자인" ? 'selected' : ''}>디자인</option>
					<option value="3"
						${pageMaker.rqcri.requestCategoey eq "버츄얼" ? 'selected' : ''}>버츄얼</option>
					<option value="4"
						${rqpageMaker.rqcri.requestCategoey eq "영상" ? 'selected' : ''}>영상</option>
					<option value="5"
					${rqpageMaker.rqcri.requestCategoey eq "웹툰" ? 'selected' : ''}>웹툰</option>
					<option value="6"
					${rqpageMaker.rqcri.requestCategoey eq "기타" ? 'selected' : ''}>기타</option>
				</select>
			
				<select id="useSort" name="requestUse" onchange="search()">
					<option value="">선택해주세요</option>
					<option value="1"
						${rqpageMaker.rqcri.requestCategoey eq "상업용" ? 'selected' : ''}>상업용</option>
					<option value="2"
						${rqpageMaker.rqcri.requestCategoey eq "방송용" ? 'selected' : ''}>방송용</option>
					<option value="3"
						${pageMaker.rqcri.requestCategoey eq "비상업용" ? 'selected' : ''}>비상업용</option>
				</select>
			</form>
		</ul>
	</div>
	
	<div class='row'>
		<div class="col-lg-12">
	
			<form id='searchForm' action="/request/requestList" method='get'>
				<select name='rqtype'>
					<option value=""
						<c:out value="${rqpageMaker.rqcri.rqtype == null?'selected':''}"/>>--</option>
					<option value="T"
						<c:out value="${rqpageMaker.rqcri.rqtype eq 'T'?'selected':''}"/>>제목</option>
					<option value="C"
						<c:out value="${rqpageMaker.rqcri.rqtype eq 'C'?'selected':''}"/>>내용</option>
					<option value="W"
						<c:out value="${rqpageMaker.rqcri.rqtype eq 'W'?'selected':''}"/>>작성자</option>
					<option value="TC"
						<c:out value="${rqpageMaker.rqcri.rqtype eq 'TC'?'selected':''}"/>>제목 or 내용</option>
					<option value="TW"
						<c:out value="${rqpageMaker.rqcri.rqtype eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
					<%-- <option value="TWC"
						<c:out value="${rqpageMaker.rqcri.rqtype eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option> --%>
				</select> 
				<input type='text' name='rqkeyword'value='<c:out value="${rqpageMaker.rqcri.rqkeyword}"/>' /> 
				<input type='hidden' name='rqpageNum' value='<c:out value="${rqpageMaker.rqcri.rqpageNum}"/>' /> 
				<input type='hidden' name='rqamount' value='<c:out value="${rqpageMaker.rqcri.rqamount}"/>' />
				<button class='btn btn-default'>Search</button>
			</form>
		</div>
	</div>

	<table border="1">
		<thead>
			<tr>
				<th>상태</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>접수마감</th>
				<th>완료기한</th>
			</tr>	
		</thead>
		
		<div>
			<form>
				<c:forEach items="${rqlist }" var="rqlist">
					<tr>	
						<%-- <input type="hidden" value="${rqlist.requestNum } }"/> --%>
						<td><c:out value="${rqlist.requestStatus }"/></td>
						<td><c:out value="${rqlist.requestCategory }"/></td>
						<td>
						<a class='move' href='<c:out value="${rqlist.requestNum }"/>'>	
						<c:out value="${rqlist.requestUse }"/> &nbsp;&nbsp;<c:out value="${rqlist.requestTitle }"/></a></td>
						<td><c:out value="${rqlist.requestWriter }"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${rqlist.requestFinish }" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${rqlist.requestDead }" /></td>							
					</tr>	
				</c:forEach>
			</form>		
		</div>						
	</table>
	
	<div class='pull-right'>
		<ul class="pagination">
		
			<c:if test="${rqpageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${rqpageMaker.startPage -1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${rqpageMaker.startPage}"
					end="${rqpageMaker.endPage}">
					<li class="paginate_button  ${rqpageMaker.rqcri.rqpageNum == num ? "active":""} ">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${rqpageMaker.next}">
					<li class="paginate_button next"><a
						href="${rqpageMaker.endPage +1 }">Next</a></li>
				</c:if>
		</ul>
	</div>	
	
	<form id='actionForm' action="/request/requestList" method='get'>
		<input type='hidden' name='rqpageNum' value='${rqpageMaker.rqcri.rqpageNum}'>
		<input type='hidden' name='rqamount' value='${rqpageMaker.rqcri.rqamount}'>
		<input type='hidden' name='rqtype' value='<c:out value="${ rqpageMaker.rqcri.rqtype }"/>'> 
		<input type='hidden' name='rqkeyword' value='<c:out value="${ pageMaker.rqcri.rqkeyword }"/>'>
		<input type='hidden' name='category' value='${rqpageMaker.rqcri.requestCategoey}'>
	</form>
	
	
</div>

</body>
</html>