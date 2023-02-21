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
		$('input[name="requestCategory"]').val(requestCategory);
		console.log($('input[name="requestCategory"]').val());
		alert(requestSort);
		$('#actionForm1').submit();
	}) */
	
	/* var searchForm = $("#searchForm");

	$("#searchForm button").on("click",function(e) {

			if (!searchForm.find("input[name='rqkeyword']").val()) {
			alert("키워드를 입력하세요");
			return false;
			}

			searchForm.find("input[name='rqpageNum']").val("1");
			e.preventDefault();
			searchForm.submit();

			}); */
	

	var actionForm = $("#actionForm");
		/* actionForm.find("input[name='rqpageNum']").val('1'); */

		$('#category').on('change', function() {
					let requestCategory = $(this).find('option:selected').val();
					alert(requestCategory);
					$('select[name="requestCategory"]').val(requestCategory);
					alert($('select[name="requestCategory"]').val());
					$('#actionForm').submit();
				});

		$('#use').on('change', function() {
							let requestUse = $(this).find('option:selected').val();
							alert(requestUse);
							$('select[name="requestUse"]').val(requestUse);
							alert($('select[name="requestUse"]').val());
							$('#actionForm').submit();
						});

		$("#actionForm button").on("click",function(e) {
	
			
			e.preventDefault();
					let keyword= $(actionForm).find("input[name='rqkeyword']").val();
					alert("외않된데"+keyword);
					if (!keyword) {
						alert("키워드를 입력하세요");
						return false;
					}

					actionForm.find("input[name='rqpageNum']").val("1");
					
					actionForm.submit();

				});

	});
</script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/>
<div>
	<div class="requestSort">
		<ul align="center" >
			<form id="actionForm" method="get" action="/request/requestList">
				<input type='hidden' name='rqpageNum' value='${rqpageMaker.rqcri.rqpageNum}'>
				<input type='hidden' name='rqamount' value='${rqpageMaker.rqcri.rqamount}'>
				
				<select id="category" name="requestCategory">
					<option value="">선택해주세요</option>
					<option value="일러스트"
						${rqpageMaker.rqcri.requestCategory eq "일러스트" ? 'selected' : ''}>일러스트</option>
					<option value="디자인"
						${rqpageMaker.rqcri.requestCategory eq "디자인" ? 'selected' : ''}>디자인</option>
					<option value="버츄얼"
						${pageMaker.rqcri.requestCategory eq "버츄얼" ? 'selected' : ''}>버츄얼</option>
					<option value="영상"
						${rqpageMaker.rqcri.requestCategory eq "영상" ? 'selected' : ''}>영상</option>
					<option value="웹툰"
					${rqpageMaker.rqcri.requestCategory eq "웹툰" ? 'selected' : ''}>웹툰</option>
					<option value="기타"
					${rqpageMaker.rqcri.requestCategory eq "기타" ? 'selected' : ''}>기타</option>
				</select>
			
				<select id="use" name="requestUse">
					<option value="">선택해주세요</option>
					<option value="상업용"
						${rqpageMaker.rqcri.requestUse eq "상업용" ? 'selected' : ''}>상업용</option>
					<option value="방송용"
						${rqpageMaker.rqcri.requestUse eq "방송용" ? 'selected' : ''}>방송용</option>
					<option value="비상업용"
						${pageMaker.rqcri.requestUse eq "비상업용" ? 'selected' : ''}>비상업용</option>
				</select>
				
				<input type='text' name='rqkeyword' value='${rqpageMaker.rqcri.rqkeyword}' placeholder="제목,작성자" /> 
				<input type="hidden" name="rqtype" value="TW">
				<button type="submit">Search</button>
			</form>
		</ul>
	</div>

	<table border="1" align="center" >
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
						<c:out value="${rqlist.requestUse }"/> &nbsp;-&nbsp;<c:out value="${rqlist.requestTitle }"/></a></td>
						<td><c:out value="${rqlist.requestWriter }"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${rqlist.requestFinish }" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${rqlist.requestDead }" /></td>							
					</tr>	
				</c:forEach>
			</form>		
		</div>						
	</table>
	
	<div class='pull-right'>
		<ul class="pagination" align="center">
		
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
	
	<c:if test="${loginUser != null }">
	<a href="/request/requestInsertForm">
		<button type="submit" value="글쓰기">글쓰기</button>
	</a>
	</c:if>
</div>

</body>
</html>