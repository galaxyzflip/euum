<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.table{
  margin: auto;
  width: 1000px;
  height: 200px;
}

#write{
  float: right;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.2.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.2.3/js/bootstrap.min.js"></script>
</head>
 
 
<body>

<br><br><br><br><br><br>
<div id="qnaMain" align="center">
<table class="table">

  
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">이름</th>
      <th scope="col">조회수</th>
      <th scope="col">등록일</th>
    </tr>
  </thead>
  

  <tbody>
    <c:forEach items="${list}" var="var">
    
    <tr>   
      <th scope="row">${var.qnaNum }</th> <!-- 번호 -->
      <td><a class='move' href='/qna/Detail?qnaNum=<c:out value="${var.qnaNum}"/>'>
    
	<c:choose> 
		<c:when test="${var.qnaOrdered > 0}" > 
		    RE:<c:out value="${var.qnaTitle }"/>
		</c:when>
		<c:otherwise> 
			<c:out value="${var.qnaTitle }"/>
		</c:otherwise> 
	</c:choose>  
      </a></td>
      
      <td><c:out value="${var.qnaWriter }"/></td>
      <td>0</td>
      <td><fmt:formatDate value="${var.qnaRegdate }" pattern="yyyy-MM-dd" /></td>
    </tr>
 
    </c:forEach>
  </tbody>
  
 
</table>
 

<br><br>

<div id="qnaFoot">

<div class='pull-right' align="center">
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
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

<!-- <nav aria-label="...">
  <ul class="pagination pagination-sm">
    <li class="page-item active" aria-current="page">
      <span class="page-link">1</span>
    </li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
  </ul>
</nav> -->

<%-- <div class='pull-right'>
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
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
</div> --%>





<form id='actionForm' action="/qna/List" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>

<button class="btn btn-primary" type="submit" id="write" onclick="location.href='/qna/insertForm';">글쓰기</button>

</div>
 
</div>

</body>

<script type="text/javascript">
/* $(".move").on("click",function(e) {
	e.preventDefault();
	actionForm
			.append("<input type='hidden' name='qnaNum' value='"
					+ $(this).attr(
							"href")
					+ "'>");
	actionForm.attr("action",
			"/qna/Detail");
	actionForm.submit();

}); */
$(document).ready(function(){
	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e) {

				e.preventDefault();

				console.log('click');

				actionForm.find("input[name='pageNum']")
						.val($(this).attr("href"));
				actionForm.submit();
			});

});										
</script>
</html>