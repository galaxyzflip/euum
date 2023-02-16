<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <c:forEach items="${list}" var="var" varStatus="vs">

    <tr>   
      <th scope="row">${var.qnaNum }</th> <!-- 번호 -->
      <td><a class='move' onclick="move(${vs.index}); return false;" href='/qna/Detail?qnaNum=<c:out value="${var.qnaNum}"/>'>
      <input type="hidden" id="qnaDelete" name="qnaDelete" value="${var.qnaDelete}"/>

	<c:choose> 
	    <c:when test="${var.qnaDelete eq 'Y'}" > 
		    삭제된 게시글입니다
		</c:when>
		<c:when test="${var.qnaOrdered > 0 and var.qnaDelete eq 'N'}" > 
		   ↪RE:<c:out value="${var.qnaTitle }"/>
		</c:when>
		<c:otherwise> 
			<c:out value="${var.qnaTitle }"/>
		</c:otherwise> 
	</c:choose>  
    
      </a></td>
      
      <td><c:out value="${var.qnaWriter }"/></td>
      <td>${var.qnaHitcount}</td>
      <td><fmt:formatDate value="${var.qnaRegdate }" pattern="yyyy-MM-dd" /></td>
    </tr>
 
    </c:forEach>
  </tbody>
  
 
</table>
 

<br><br>

<div id="qnaFoot">

  	<div class='row'>
		<div class="col-lg-12">

			<form id='searchForm' action="/qna/List" method='get'>
				<select name='type'>
					<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
					<option value="W"
						<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
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
     <li class="page-item">
     <a class="page-link" href="${pageMaker.startPage -1}" tabindex="-1">Previous</a>
     </li>
  </c:if> 
    
    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
      <li class="page-item ${pageMaker.cri.pageNum == num ? " active":""} ">
      <a class="page-link" href="${num}">${num}</a></li>     
    </c:forEach>
    
   <c:if test="${pageMaker.next}">
     <li class="page-item">
     <a class="page-link" href="${pageMaker.endPage +1}" tabindex="-1">Next</a>
     </li>
   </c:if>
    
  </ul>
</div>	


<form id="actionForm" action="/qna/List" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
	<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
</form>
	
</div>

<button class="btn btn-primary" type="submit" id="write" onclick="location.href='/qna/insertForm';">글쓰기</button>


</div>
 
</div>

</body>

<script type="text/javascript">
   /* $(".move").on("click",function(e) {  
	 e.preventDefault();
	 
	 alert("d");
	 
})   */
 
function move(index) {
    var i = index;
	var a = document.getElementsByName("qnaDelete")[i].value; 

  if(a == 'Y'){
		
	alert("삭제된 게시글입니다.")
	} else{
		form.submit();
	}  

} 

$(document).ready(function(){
	var actionForm = $("#actionForm");

	$(".page-link").on("click", function(e) {

		e.preventDefault();
              
		var targetPage = $(this).attr("href");
        
	    console.log(targetPage);
	    
	    actionForm.find("input[name='pageNum']").val(targetPage);  
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

})										
</script>
</html>