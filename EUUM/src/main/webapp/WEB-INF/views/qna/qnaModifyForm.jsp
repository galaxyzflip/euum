<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<style>
#main{
  margin-left: 400px;
  width: 900px;
}
.table{
   width: 300px;
   height: 300px;
}
.caution {	
	color: #FF6600;
}
h1, h6{
  font-family:맑음 고딕;
  margin-left:0px;
}
.qnaImage{
  width:270px; 
  height:250px;
  margin-left:0px;
}
#registerBtn{
  float:right;
}
#qnaTitle{
  width:650px;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
</head>
<body>


<div id="main">
<form id="frm" action="/qna/modifyPro" method="post" enctype="multipart/form-data">
<div id="detail">

<br><br><br><br><br>
<h1>고객 문의</h1>
<h6>상담 업무 시간 : AM 10시 ~ PM 5시 / 점심 12 ~ 1시. 토, 일, 공휴일 휴무</h6>
<br>
<h3>문의 수정</h3>
<table class="table table-sm">
		<colgroup>
			<col width="10%"/>
		    <col width="0%"/>
		    <col width="10%"/>
			<col width="18%"/> 
		</colgroup>
		<tbody>
			<tr>
			
			<!-- <th scope="row">제목</th> -->
			<label for="title">제목</label>
			<input type="text" class="form-control" id="qnaTitle" name="qnaTitle" value="${detail.qnaTitle}"/>	    
                	
	<div class="caution"> 
    <span class="span_validate" id="qnaTitleMsg" aria-live="assertive"></span>
    </div> 		
			<br>
 		    </tr>
	
		    
			<tr>
				<th scope="row">작성자</th>
				<td>${detail.qnaWriter }</td>
				<th scope="row">작성일</th>
				<td><fmt:formatDate value="${detail.qnaRegdate }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
		         <td colspan="4">
		        
		        <!--  이미지 리스트 -->
		        <div id="qnaImage" >
	             <c:forEach items="${image}" var="row">
	             <img src="/resources/img/${row.imageUploadPath}${row.imageFileName}" class="qnaImage">        
	             </c:forEach>  
	            <p> 
	             <br>
	             <input type="file" name="uploadFile">
	             <input type="file" name="uploadFile">	
	             <input type="file" name="uploadFile">		
		        </p>
		        </div>
		        
		        <textarea class="form-control" rows="17" id="qnaContent" name="qnaContent">${detail.qnaContent}</textarea>
	       <%-- <input type="text" class="form-control" id="qnaContent" name="qnaContent" value="${detail.qnaContent}"> --%>
		        <div class="caution">
			    <span class="span_validate" id="qnaContentMsg" aria-live="assertive"></span>   
			    </div> 
		        
		         </td>             			
			</tr>
			
		</tbody>
	</table>
<input type="hidden" name="qnaNum" value="${detail.qnaNum }"/>
</div>
<button type="button" class="btn btn-primary" onclick="location.href='/qna/List';">목록으로</button>


<button type="button" class="btn btn-primary" id="registerBtn">수정하기</button>


</form>


</div>
<br><br><br><br><br><br>
</body>

<script type="text/javascript">
function registerValidate() {

	console.log("유효성 시작");
	console.log(checkUnrealInput());
	return checkUnrealInput();
}

$("#qnaTitle").blur(function() {
    checkName();
});
 $("#qnaContent").blur(function() {
    checkContent();
}); 

function checkName() {
	var oMsg = $("#qnaTitleMsg");
	var inputValue = $("#qnaTitle").val();
	var inputTag = $("#qnaTitle");
	
	console.log("제목" + inputValue);
	console.log("제목Tag 값" + inputTag);
	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("제목 X");
	    return false;
	}
	console.log("제목 OK");
	hideMsg(oMsg);
	return true;
}


function checkContent() {
    var oMsg = $("#qnaContentMsg");
	var inputValue = $("#qnaContent").val();
	var inputTag = $("#qnaContent");
	console.log("내용" + inputValue)
	
	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("내용 X");
	    return false;
	}
	console.log("내용 OK");
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
	if (checkName() & checkContent()) {
	    console.log("성공ㅇㅇ");
	    return true; // true
	} else {
	    console.log("실패ㅜㅜ");
	    return false;
	}
}


$(function() {
    /*등록 버튼 */
    var registerBtn = $("#registerBtn");
    const form = $("#frm");
    
    registerBtn.click(function() {
	    if(!registerValidate()) {
			return false;
	    }
	  
		 form.submit(); 
	})
	
});



</script>
</html>