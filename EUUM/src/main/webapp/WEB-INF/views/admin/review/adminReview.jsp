<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Custom styles for this page -->
<link href="/resources/sbadmin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">작품문의</h1>
	<p class="mb-4">
		DataTables is a third party plugin that is used to generate the demo
		table below. For more information about DataTables, please visit the <a
			target="_blank" href="https://datatables.net">official DataTables
			documentation</a>.
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>평점</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>삭제여부</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>번호</th>
							<th>평점</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>삭제여부</th>
						</tr>
					</tfoot>
					
					<tbody>
					<c:forEach items="${list}" var="var">
						<tr>
							<td>${var.reviewNum }</td>
							<td>
						    <span style="color: #ffc81e"> 
								<c:if test="${var.reviewStar eq 1}">
									<c:out value="★☆☆☆☆" /></c:if>
								 <c:if test="${var.reviewStar eq 2}">
									<c:out value="★★☆☆☆" /></c:if>
								 <c:if test="${var.reviewStar eq 3}">
									<c:out value="★★★☆☆" /></c:if> 
								<c:if test="${var.reviewStar eq 4}">
									<c:out value="★★★★☆" /></c:if> 
								<c:if test="${var.reviewStar eq 5}">
									<c:out value="★★★★★" /></c:if>
					         </span>
							</td>
							<td>
				<a href="#"><p onclick="openModal('${var.reviewNum}','${var.reviewTitle}','${var.reviewContent}')">${var.reviewTitle }</p></a>
							</td>
							<td>${var.reviewWriter }</td>
			                <td><fmt:formatDate value="${var.reviewRegdate }" pattern="yyyy-MM-dd" /></td>   
						   
						<c:choose>
							<c:when test="${var.reviewDelete eq 'N'}">
							   <td>미삭제</td>
							</c:when>	
							<c:otherwise>
							   <td>
							   <a href="#"><p onclick="cancel('${var.reviewNum}')">삭제 취소</p></a>
							   </td>
							</c:otherwise>
						</c:choose>  
						   
						</tr>
				
						</c:forEach>	
					</tbody>
				
				</table>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<!-- modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">상세보기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    
    <form id="frm" method="post">
      <div class="modal-body">
     
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">제목:</label>
            <input type="text" class="form-control" id="recipient-name" name="reviewTitle" readonly>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용:</label>
            <textarea class="form-control" id="message-text" name="reviewContent" readonly></textarea>
          
          </div>
      </div>
      <input type="hidden" name="reviewNum">
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="deleteReview()">삭제</button>
      </div>
    </form>
    
    </div>
  </div>
</div>



<!-- Custom scripts for all pages-->
<script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
<script type="text/javascript"> 
function openModal(reviewNum,reviewTitle,reviewContent){
	$('#exampleModal').modal('show');
	
	$('input[name="reviewNum"]').val(reviewNum);
    $('input[name="reviewTitle"]').val(reviewTitle);
    $('textarea[name="reviewContent"]').text(reviewContent);

}

function deleteReview() {
	 var frm = $("#frm");
	 frm.attr("action", "/deleteAdminReview");

	 frm.submit();
	
}
function cancel(reviewNum) {
	
	$.ajax({
		url : "/cancelReviewDelete",
		type : "post",
		data : {
			    reviewNum: reviewNum
			},
		success : function(data){
			location.reload();
		},
		error : function(error){
			alert('에러');
		} 
		
	})
}
</script>   