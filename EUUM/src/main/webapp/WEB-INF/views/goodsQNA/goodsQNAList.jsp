<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>

<style>
html,body {
  font-family: Helvetica, Arial, sans-serif;
  margin: 0;
}
.panel-faq-container {
  margin-bottom: -16px;
}
.panel-faq-title {
  color: #00eaea;
  cursor: pointer;
}
.panel-faq-answer {
  height: 0;
  overflow: hidden;
  /* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
  왜? 닫기 버튼을 누를 때 변화가 티남 */
  transition: all 1s;
}
#btn-all-close {
  margin-bottom: 10px;
  background-color: #726996;
  border: none;
  color: #fff;
  cursor: pointer;
  padding: 10px 25px;
  float: right;
}
#btn-all-close:hover {
  background-color: yellow;
  color: #000;
  transition: all 0.35s;
}
.active {
  display: block;
  /* 높이를 정해줘야지만 transition이 적용됨 */
  height: 300px;
}
</style>


<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
</head>
<body>


<div id="main">

<div class="container">
   
    <br><br><br><br><br><br>
    <h2>문의 및 답변</h2>
    <form action="/goodsQNA/InsertForm" method="get">
    <button type="submit" class="btn btn-default" >문의하기</button>   
    <input type="hidden" name="goodsNum" value="${goodsNum}"/>
    </form>
     
    <table class="table table-bordered table-striped table-dark table-hover">
     
      <thead class="thead-light text-center">
        <tr>
          <th>번호</th>
          <th>답변 상태</th>
          <th>문의 내용</th>
          <th>작성자</th>
          <th>작성일</th>
         
        </tr>
      </thead>
      <c:forEach items="${list}" var="var" varStatus="vs">
        
      <input type="hidden" id="goodsNum" name="goodsNum" value="${var.goodsNum}"/> 
   
      <tbody class="text-center">
        <tr>
          <td>${var.goodsQNANum}</td>
          <td>답변 중 </td>
         
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title">${var.goodsQNATitle }</p>
              <div class="panel-faq-answer">              
                <p>${var.goodsQNAContent }</p>
                <p>${var.goodsQNAComment }</p>
                
                
              <!-- Button trigger modal -->
			
			  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop${vs.index}">
				  답변 작성
			  </button>
				
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop${vs.index}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>				       
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				     
				     <form action="/goodsQNA/InsertComment" method="post" onsubmit="reply();">
				      <div class="modal-body">
				       
				          <div class="mb-3">
				            <label for="message-text" class="col-form-label">Message:</label>
				            <textarea class="form-control" id="message-text" name="goodsQNAComment" ></textarea>
				          </div>
				       
				        <input type="hidden" id="goodsNum" name="goodsNum" value="${var.goodsNum}"/>
				        <input type="hidden" id="goodsQNANum" name="goodsQNANum" value="${var.goodsQNANum}"/> 
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="submit" class="btn btn-primary" >답변하기</button>
				      </div>
				     </form>   
				    
				    </div>
				  </div>
				</div>
    
              
              </div>
            </div>
          </td>
          <td>${var.goodsQNAWriter }</td>
          <td><fmt:formatDate value="${var.goodsQNARegdate}" pattern="yyyy-MM-dd" /></td>       
        </tr>



     </c:forEach>
        
    

       </tbody>
    </table>
  </div>

<div id="goodsQNAPaging">

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


<form id="actionForm" action="/goods/goodsDetail" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='goodsNum' value='${goodsNum}'>
</form>

</div>

</div>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
window.onload = () => {
	  // panel-faq-container
	  const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
	  
	  // panel-faq-answer
	  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

	  
	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
	  for( let i=0; i < panelFaqContainer.length; i++ ) {
	    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
	      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
	      panelFaqAnswer[i].classList.toggle('active');
	    });
	  };
	  
	 
	 
	}
function reply() {
	$('#commentOriginalNum').val(rid)
}

function test(){
	var num = $('#goodsNum').val() 
	
	alert(num);
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