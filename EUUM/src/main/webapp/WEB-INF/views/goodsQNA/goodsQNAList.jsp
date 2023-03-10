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
  color: #fb8500;
  cursor: pointer;

}
.panel-faq-answer {
  height: 0;
  overflow: hidden;
  /* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
  왜? 닫기 버튼을 누를 때 변화가 티남 */
  transition: all 1s;
}
 .active {
  display: block;
  /* 높이를 정해줘야지만 transition이 적용됨 */
  height: 450px;
} 
.caution {	
	color: #FF6600;
}
#gQNAMain{
  display: inline-block;
  margin-left: 325px;
}
#goodsQNAPaging{
  margin-left: 16px;
}
td {
  font-family:맑음 고딕;
}
#gQNATable{
  width:1000px;
 
}
</style>


<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
</head>
<body>


<div id="gQNAMain">

<div class="container">
   
    <br><br><br><br><br><br>
    
    <h2>문의 및 답변</h2> 
    <input type="hidden" data-name="sellerName" value="${detail.goodsSellerNickname }">
    <form action="/goodsQNA/InsertForm" method="get">
    <button type="submit" class="btn btn-default" >문의하기</button>   
    <input type="hidden" name="goodsNum" value="${goodsNum}"/>
    </form>
     
    <table class="table table-bordered table-striped table-white table-hover" id="gQNATable">
     
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
          
          <c:choose>
          <c:when test="${var.goodsQNAComment == null}">
          <td>답변 중 </td>
         </c:when>
         <c:otherwise>
         <td>답변 완료</td>
         </c:otherwise>
          </c:choose>
          
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title">${var.goodsQNATitle }
              </p>
              
              
              <div class="panel-faq-answer">   
                   
           <c:forEach var="image" items="${var.imageBean}">
		    <img src="/resources/img/${image.imageUploadPath}${image.imageFileName}" width=140; height=150;>
		   </c:forEach>       
          	
        	<p><img src="/resources/img/icon/q.png" style="float:left; margin-top:17px;" width=34; height=38;>
            </p>           
           <pre><c:out value="${var.goodsQNAContent }" /></pre> 
               <br>
                <hr style="border: solid 1px black;">
                
                <c:if test="${var.goodsQNAComment != null }">
                <p><img src="/resources/img/icon/a.png" style="float:left; " width=50; height=50;>
                </c:if>
     
            <pre><c:out value="${var.goodsQNAComment }" /></pre>  </p>          
              <!-- Button trigger modal -->
             <c:choose>
             <c:when test="${detail.memberNum eq memberNum }">
			 <br>
			 <button type="button" id="comment" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop${vs.index}" onclick="openModal('${var.goodsQNANum}','${vs.index }','${var.goodsNum}')">
				  답변 작성
			  </button>			
			  
			  </c:when>
			  <c:otherwise>
			  </c:otherwise>
             </c:choose>
    
              
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

<!-- 페이징 -->
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

<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="staticBackdropLabel">답변 작성</h1>				       
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				     
				     <form action="/goodsQNA/InsertComment" method="post" id="frm" >
				      <div class="modal-body">
				       
				          <div class="mb-3">
				            <label for="message-text" class="col-form-label">내용:</label>
				            <textarea class="form-control" rows="5" id="goodsQNAComment" name="goodsQNAComment" ></textarea>
				          
		   </div>
		   <div class="caution">
		    <span class="span_validate" id="goodsQNACommentMsg" aria-live="assertive"></span>   
		   </div>  
				       
				       <input type="hidden" id="goodsNum" name="goodsNum" />
				       <input type="hidden" id="goodsQNANum" name="goodsQNANum" />  
				       
				      <%--   <input type="hidden" id="goodsNum" name="goodsNum" value="${var.goodsNum}"/>
				        <input type="hidden" id="goodsQNANum" name="goodsQNANum" value="${var.goodsQNANum}"/>  --%>
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" id="registerBtn" class="btn btn-primary" >답변하기</button>
				      </div>
				     </form>   
				    
				    </div>
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

$(document).ready(function(){
	var actionForm = $("#actionForm");

	$(".page-link").on("click", function(e) {

		e.preventDefault();
              
		var targetPage = $(this).attr("href");
        
	    console.log(targetPage);
	    
	    actionForm.find("input[name='pageNum']").val(targetPage);  
	    actionForm.submit();
	});

})		

function registerValidate() {

	console.log("유효성 시작");
	console.log(checkUnrealInput());
	return checkUnrealInput();
}

$("#goodsQNAComment").blur(function() {
    checkName();
});

function checkName() {
	var oMsg = $("#goodsQNACommentMsg");
	var inputValue = $("#goodsQNAComment").val();
	var inputTag = $("#goodsQNAComment");
	
	var valval = document.getElementsByName("goodsQNAComment")[0].value
	 
	console.log("name 값" + inputValue);
	console.log("inputTag 값" + inputTag);
	console.log("inputname값?" + valval)
	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("제목 X");
	    return false;
	}
	console.log("제목 OK");
	hideMsg(oMsg);
	return true;
}

/* ------------------------------------------------------------------------------------------------------------ */
// 텍스트기입 공란방지 사후처리
function PreventBlank(inputValue, inputTag, oMsg) {
   
	
	if(inputValue == "") {
	    showErrorMsg(oMsg, "필수 입력 사항입니다."); // 유효성탈락에 대한 메시지
    	setFocusToInputObject(inputTag); // 포커스를 줌
		return true;
	} 
	
	else {
		return false;
	}
}

// 포커스를 입력개체에 설정
function setFocusToInputObject(inputTag) {
	    inputTag.focus();
}

// (조건 충족 X) 에러 메세지 출력
function showErrorMsg(oMsg, msg) {
	oMsg.attr("class", "span_validate");
	oMsg.html(msg);
	oMsg.show();
}

// (조건 충족 O) 에러 메시지 숨기기
function hideMsg(obj) {
	obj.hide();
}

// (상품등록) 유효성 전체 검사
function checkUnrealInput() {
	if (checkName()) {
	    console.log("성공ㅇㅇ");
	    return true; // true
	} else {
	    console.log("실패ㅜㅜ");
	    return false;
	}
}


$(function() {
    
    var registerBtn = $("#registerBtn");
    const form = $("#frm");
    
    registerBtn.click(function() {
	    if(!registerValidate()) {
			return false;
	    }
	  
		form.submit();
	})
	
}); 
function openModal(goodsQNANum,index,goodsNum){	
		$('.modal').modal('show');
		$('input[name="goodsQNANum"]').val(goodsQNANum);
		$('input[name="goodsNum"]').val(goodsNum);
		
}

</script>

</html>