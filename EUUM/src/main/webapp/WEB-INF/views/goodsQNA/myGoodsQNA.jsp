<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>     
<!DOCTYPE html>
<html>
<head>

<style type="text/css">  
.hiddenRow {
    padding: 0 !important;
}

#myGQNA {
   width: 1400px;
   height: 300px;
   margin-left: 150px;
}
  
</style>  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
</head>  

<body>  
  
  <br><br><br><br><br><br>
  <div id="myGQNA">
 
  <table class="table table-condensed" style="border-collapse:collapse;">
    <thead>
        <tr>
            <th>작가</th>
            <th>제목</th>
            <th>날짜</th>
        </tr>
    </thead>
    <tbody>
     <c:forEach items="${list}" var="var" varStatus="vs">
    
        <tr data-toggle="collapse" data-target=".demo1${vs.index }">
            <td>답변자이름</td>
            <td>${var.goodsQNATitle }</td>
            <td><fmt:formatDate value="${var.goodsQNARegdate}" pattern="yyyy-MM-dd" />
            
<!-- modal button -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${vs.index }" onclick="openModal('${var.goodsQNANum}','${var.goodsQNATitle }','${var.goodsQNAContent}','${vs.index }')">수정/삭제</button> 
        </td>
    
        </tr>
        <tr>
            <td class="hiddenRow">
                <div class="collapse demo1${vs.index }">1</div>
            </td>
            <td class="hiddenRow">
                <div class="collapse demo1${vs.index }">
                
           <c:forEach var="image" items="${var.imageBean}" > 
		    <img src="/resources/img/${image.imageUploadPath}${image.imageFileName}" width=200; height=200;>
		<input type="hidden" class="image${vs.index }" name="image${vs.index }" value="${image.imageUploadPath}${image.imageFileName}">	   
		   </c:forEach> 
                ${var.goodsQNAContent }
                <p>${var.goodsQNAComment }</p>
                </div>
            </td>
            <td class="hiddenRow">
                <div class="collapse demo1${vs.index }">1</div>
            </td>
        </tr>
               

             
        </c:forEach>
    </tbody>
</table>


<!-- modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
   <form id="frm" method="post" enctype="multipart/form-data">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">수정하기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	     
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">제목:</label>
	            <input type="text" class="form-control" id="goodsQNATitle" name="goodsQNATitle" value="${var.goodsQNATitle }">
				<input type="hidden" name="goodsQNANum" />	          
	          </div>
	          
	          <div id="showImage">이미지

	          
	          </div>
	          
	           <td>
		      <input type="file" name="uploadFile">
	          <input type="file" name="uploadFile">	
	          <input type="file" name="uploadFile">	
              </td>  
	          
	          <div class="mb-3">
	            <label for="message-text" class="col-form-label">내용:</label>
	            <textarea class="form-control" id="goodsQNAContent" name="goodsQNAContent"></textarea>
	          </div>
	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="delete" data-oper="delete">삭제</button>
	        <button type="button" class="btn btn-primary" id="modify" data-oper="modify">저장</button>

	
	    
	      </div>
	    </div>
	  </div>
  </form>
  
</div> 


<!-- 페이징 -->
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

<form id="actionForm" action="/goodsQNA/myGoodsQNA" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>

</div>

<br><br><br><br><br><br><br><br><br><br><br><br>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">  
$('.collapse').on('show.bs.collapse', function () {
    $('.collapse.in').collapse('hide');
});
$(document).ready(function(){
	var actionForm = $("#actionForm");

	$(".page-link").on("click", function(e) {

		e.preventDefault();
              
		var targetPage = $(this).attr("href");
        
	    console.log(targetPage);
	    
	    actionForm.find("input[name='pageNum']").val(targetPage);  
	    actionForm.submit();
	});
	

});				
//모달창 테스트
 $(document).ready(function(){
	 
   var frm = $("#frm");
	
   $("#modify, #delete").on("click", function(e){   
	   
		e.preventDefault();
		
		var oper = $(this).data("oper");
		
		 if(oper === 'modify'){
			 frm.attr("action", "/goodsQNA/Modify");		
		} else if(oper === 'delete'){
			frm.attr("action", "/goodsQNA/Delete");		
		}
		 frm.submit();
	
   });
});		

 
function openModal(goodsQNANum,goodsQNATitle,goodsQNAContent,index){
/* 	const path = $('input[name=imageUploadPath]').eq(index).val();  
	const file = $('input[name=imageFileName]').eq(index).val();  */  
	
	$('.modal').modal('show');
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

/*  function imageTest(index){

	const path = $('input[name=imageUploadPath]').eq('0').val();  
	const file = $('input[name=imageFileName]').eq('0').val();   
	

    alert(path);
	alert(file); 
	
 document.getElementById('showImage').innerHTML = "<img src='/resources/img/"+ path + file + "' width='100' heigh='100'/>";

}    */
/* 	for(let i=0; i<3; i++){

idx = $('input[name="imageIdx"]').eq(i).val();

const path = $('input[name=imageUploadPath]').eq(i).val();  
const file = $('input[name=imageFileName]').eq(i).val(); 

document.getElementById('showImage').innerHTML = "<img src='/resources/img/"+ path + file + "' width='100' heigh='100'/>";		 */
/* alert(path);
alert(file); 
}  */ 

	




</script>  

</body>  

</html>  