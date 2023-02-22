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
							<th>답변상태</th>
							<th>문의제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>삭제여부</th>				
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>번호</th>
							<th>답변상태</th>
							<th>문의제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>삭제여부</th>
						</tr>
					</tfoot>
					
					<tbody>
					<c:forEach items="${list}" var="var" varStatus="status">
						<tr>s
							<td>${var.goodsQNANum }</td>
							<td>답변 중
											
	<c:forEach var="image" items="${var.imageBean}">
	
	<input type="hidden" class="image${status.index }" name="image${status.index }" value="${image.imageUploadPath}${image.imageFileName}">
	
   </c:forEach> 
							</td>
							<td>
				<a href="#"><p onclick="openModal('${var.goodsQNANum}','${var.goodsQNATitle}','${var.goodsQNAContent}'
				                  ,'${status.index}')">${var.goodsQNATitle }</p></a>
							</td>
							<td>${var.goodsQNAWriter }</td>
			                <td><fmt:formatDate value="${var.goodsQNARegdate }" pattern="yyyy-MM-dd" /></td>   
						  
						  <c:choose>
							<c:when test="${var.goodsQNADelete eq 'N'}">
							   <td>미삭제</td>
							</c:when>	
							<c:otherwise>
							  <td>
							   <a href="#"><p onclick="cancel('${var.goodsQNANum}')">삭제 취소</p></a>
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
            <input type="text" class="form-control" id="recipient-name" name="goodsQNATitle" readonly>
          </div>
          <div id="showImage">이미지
          </div>
          
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용:</label>
            <textarea class="form-control" id="message-text" name="goodsQNAContent" readonly></textarea>
            <input type="hidden" name="goodsQNANum">
          </div>   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="deleteGqna()">삭제</button>
      </div>
      
      </form>
    </div>
  </div>
</div>



    <!-- Custom scripts for all pages-->
<script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"> 
 function openModal(goodsQNANum,goodsQNATitle,goodsQNAContent,index){
	$('#exampleModal').modal('show');
	
	$('input[name="goodsQNANum"]').val(goodsQNANum);
    $('input[name="goodsQNATitle"]').val(goodsQNATitle);
    $('textarea[name="goodsQNAContent"]').text(goodsQNAContent);
    
    const image = document.getElementsByClassName('image'+index);
    
    let inner ='';
    
    for(var i=0;i<image.length;i++){
    	console.log(i + " 번째 파일이름" + image[i].value);
        
   		
    	inner += "<img src='/resources/img/"+ image[i].value +"' width='150' heigh='150'/>";		 	
        
    }
   console.log("이미지" + image) 
   document.getElementById('showImage').innerHTML = inner;
    
} 


function deleteGqna() {
	
	 var frm = $("#frm");
	 frm.attr("action", "/deleteAdminGqna");

	 frm.submit();

		
}
function cancel(goodsQNANum) {
	
	$.ajax({
		url : "/cancelGdelete",
		type : "post",
		data : {
			   goodsQNANum: goodsQNANum
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