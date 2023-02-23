<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<style>
#qnaTitle{
  width: 400px;
}
#qnaContent{
  width: 1000px;
}
.caution {
	color: #FF6600;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
 </head>


<body>


<br><br><br><br><br><br>
<div id="writeForm">
<div class="container">
  <h2>상품 문의</h2>
  <form action="/goodsQNA/InsertPro" method="post" enctype="multipart/form-data" id="frm">
    
    <div class="form-group" >
    <label for="title">제목</label>
    
    <br>
    <input type="file" name="uploadFile">
    <input type="file" name="uploadFile">
    <input type="file" name="uploadFile">
    
    <input type="hidden" name="goodsNum" value="${goodsNum}"/> 
    <input type="hidden" name="memberNum" value="${memberNum}"/> 
    <input type="hidden" name="goodsQNAWriter" value="${memberName}"/>
    
    <input type="text" class="form-control" id="goodsQNATitle" name="goodsQNATitle" placeholder="제목 입력" 
       required="required" />
   <div class="caution" >
   <span class="span_validate" id="goodsQNATitleMsg" aria-live="assertive"></span>    
   </div>
    </div>
    
  
    <div class="form-group">
   <label for="content">내용</label>
   <textarea class="form-control" rows="5" id="goodsQNAContent" name="goodsQNAContent"
     placeholder="내용 입력"></textarea>
     <div class="caution" >
   <span class="span_validate" id="goodsQNAContentMsg" aria-live="assertive"></span>    
   </div>
 </div>
    
    
    
    <button type="button" id="registerBtn" class="btn btn-default" >등록</button>
    <button type="button" class="btn btn-default" onclick="location.href='/goods/goodsDetail?goodsNum=${goodsNum}';">목록으로</button>
  <br><br><br>
  </form>
</div>

</div>
</body> 

<script type="text/javascript">

function registerValidate() {

	console.log("유효성 시작");
	console.log(checkUnrealInput());
	return checkUnrealInput();
}

$("#goodsQNATitle").blur(function() {
    checkName();
});
$("#goodsQNAContent").blur(function() {
    checkContent();
});

function checkName() {
	var oMsg = $("#goodsQNATitleMsg");
	var inputValue = $("#goodsQNATitle").val();
	var inputTag = $("#goodsQNATitle");
	
	console.log("name 값" + inputValue);
	console.log("inputTag 값" + inputTag);
	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("제목 X");
	    return false;
	}
	console.log("제목 OK");
	hideMsg(oMsg);
	return true;
}


function checkContent() {
    var oMsg = $("#goodsQNAContentMsg");
	var inputValue = $("#goodsQNAContent").val();
	var inputTag = $("#goodsQNAContent");
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
