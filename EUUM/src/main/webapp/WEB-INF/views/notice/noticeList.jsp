<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<style>
	body{
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}
.container{
	width: 5000px;
	margin: 0 auto;
}



ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	/* color: #222; */
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
	list-style:none;
    padding-left:0px;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
</style>
<head>
<script>
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
			
		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='noticeNum' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/notice/detail");
			actionForm.submit();
		});

		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {

					e.preventDefault();

					console.log('click');

					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();
				});
		
		var searchForm = $("#searchForm");

		$("#searchForm button").on("click",function(e) {
			

			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
				}

				if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
				}

				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchForm.submit();

				});
		$("#regBtn").on("click", function() {

			self.location = "/board/register";

		}); 
		

		/*	var result = '<c:out value="${result}"/>';

			checkModal(result);

			history.replaceState({}, null, null);

			 function checkModal(result) {

				if (result === '' || history.state) {
					return;
				}

				if (parseInt(result) > 0) {
					$(".modal-body").html(
							"게시글 " + parseInt(result)
									+ " 번이 등록되었습니다.");
				}

				$("#myModal").modal("show");
			}
		*/
			

})
</script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 카테고리 값 넣어줘야 함  -->
<br/><br/><br/><br/><br/><br/><br/><br/>
	
	<div class="container">

		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">공지사항</li>
			<li class="tab-link" data-tab="tab-2">의뢰인FAQ</li>
			<li class="tab-link" data-tab="tab-3">전문가FAQ</li>
		</ul>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>	
					<th scope="col">작성자</th>
					<th scope="col">등록일</th>
					<th scope="col">조회수</th>
				</tr>			
			</thead>
			
			
			<div id="tab-1" class="tab-content current">
				<c:forEach items="${list }" var="notice">
					<c:if test= "${ notice.noticeCategory eq 1}">
					<li>	
						<c:out value="${notice.noticeNum}" />
		               <td>
		                   <a class='move' href='<c:out value="${notice.noticeNum}"/>'>	                   
		                   <c:out value="${notice.noticeTitle}" />  
		                   </a>
		                </td>
		               <td><c:out value="${notice.noticeWriter}" /></td>
		               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeRegdate}" /></td>
					</li>
					</c:if>
				</c:forEach>
				
				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/notice/notice" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
							</select> 
							<input type='text' name='keyword'value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>
			
			<div class='pull-right'>
				<ul class="pagination">
				
					<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
				</ul>
			</div>	
			</div>
			
			<!-- FAQ -->
			<div id="tab-2" class="tab-content">
				<c:forEach items="${FAQ }" var="FAQ">
					<c:if test= "${ FAQ.noticeCategory eq 2}">
					<li>	
						<c:out value="${FAQ.noticeNum}" />
		                <td>
		                   <a class='move' href='<c:out value="${FAQ.noticeNum}"/>'>	                   
		                   <c:out value="${FAQ.noticeTitle}" />  
		                   </a>
		                </td>
		               <td><c:out value="${FAQ.noticeWriter}" /></td>
		               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${FAQ.noticeRegdate}" /></td>
					</li>
					</c:if>
				</c:forEach>
			</div>
			<div id="tab-3" class="tab-content">
				<c:forEach items="${FAQ }" var="FAQ">
					<c:if test= "${ FAQ.noticeCategory eq 3}">
					<li>	
						<c:out value="${FAQ.noticeNum}" />
		                <td>
		                   <a class='move' href='<c:out value="${FAQ.noticeNum}"/>'>	                   
		                   <c:out value="${FAQ.noticeTitle}" />  
		                   </a>
		                </td>
		               <td><c:out value="${FAQ.noticeWriter}" /></td>
		               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${FAQ.noticeRegdate}" /></td>
					</li>
					</c:if>
				</c:forEach>
			</div>
			
			<form id='actionForm' action="/notice/notice" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
				<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			</form>
				
		<a href="noticeInsertForm">
		<input type="button" value="글쓰기"></a> 

</div>	
	
	
</body>
</html>