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
	<h1 class="h3 mb-2 text-gray-800">작품의뢰</h1>
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
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>접수상태</th>
							<th>완료기한</th>
							<th>삭제여부</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>접수상태</th>
							<th>완료기한</th>
							<th>삭제여부</th>
						</tr>
					</tfoot>
					
	
					<tbody>
					<c:forEach items="${list}" var="var">		
		
						<tr>
							<td>${var.requestNum}</td>
							<td>${var.requestCategory}</td>
							<td>
				<a href="#"><p onclick="openModal('${var.requestNum}','${var.requestStatus}'
				,'${var.requestTitle}','${var.requestContent}')">${var.requestTitle}</p></a>
							</td>
							<td>${var.requestWriter}</td>
							<td>${var.requestStatus}</td>
			                <td><fmt:formatDate value="${var.requestFinish}" pattern="yyyy-MM-dd" /></td>   
					
						<c:choose>
							<c:when test="${var.requestDelete eq 'N'}">
							   <td>미삭제</td>
							</c:when>	
							<c:otherwise>
							
							  <td>
							  <a href="#"><p onclick="cancel('${var.requestNum}')">삭제 취소</p></a>
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
            <input type="text" class="form-control" id="recipient-name" name="requestTitle" readonly>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용:</label>
            <textarea class="form-control" id="message-text" name="requestContent" readonly></textarea>
          </div>      
      </div>
      
      <input type="hidden" name="requestStatus">
      <input type="hidden" name="requestNum">
      <div class="modal-footer">
     
	    <button type="button" class="btn btn-primary" data-oper="status" id="status"></button>  
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" data-oper="delete" id="delete">삭제</button>
      </div>
    </form>
    
    </div>
    

  </div>
</div>



<!-- Custom scripts for all pages-->
<script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
<script type="text/javascript"> 
const sBtn = document.getElementById("status");

function openModal(requestNum,requestStatus,requestTitle,requestContent){
	
	$('#exampleModal').modal('show');
	$('input[name="requestNum"]').val(requestNum);
    $('input[name="requestStatus"]').val(requestStatus);
    $('input[name="requestTitle"]').val(requestTitle);
    $('textarea[name="requestContent"]').text(requestContent);
	
    sBtn.innerHTML = `승인`;

}

$(document).ready(function(){
	 
	   var frm = $("#frm");
		
	   $("#status, #delete").on("click", function(e){   
		   
			e.preventDefault();
			
			var oper = $(this).data("oper");
			
			 if(oper === 'status'){
				 frm.attr("action", "/updateRstatus");		
			} else if(oper === 'delete'){
				frm.attr("action", "/deleteRequestAdmin");		
			}
			 frm.submit();
		
	   });
	});	
function cancel(requestNum) {

 	$.ajax({
		url : "/cancelRequestDelete",
		type : "post",
		data : {
				requestNum: requestNum
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

