<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, form, fieldset, p, button {
    margin: 0;
	    padding: 0;
	  
}

div {
    display: block;
}

.modifybody {
   	max-width: 980px;
    margin: 0 auto;
    list-style: none;
        
} 

#modifyMember li div:nth-child(1) {
    width: 136px;
    line-height: 32px;
}

#modifyMember li div {
    float: left;
    line-height: 2;
}

.s_title {
    font-size: 20px;
    letter-spacing: -1px;
    display: inline-block;
}

.1sp li div {
	float: left;
}

.fsize12 {
    font-size: 12px;
    float: left;
}

.accordion-button {
   	float: left;
    cursor: pointer;
    padding: 0 10px;
    height: 28px;
    text-align: center;
    line-height: 28px;
    border: 1px solid #dadada;
    font-size: 13px;
    margin: 0 auto;
    border-radius: 3px;
}

.accordion-button collapsed {
	float: left;
}

.blank {
    clear: both;
    overflow: hidden;
}

.left_li li {
    float: left;
}

.btn1 {
    width: 188px;
    height: 58px;
    line-height: 58px;
    background: #343434;
    color: #fff;
    text-align: center;
    cursor: pointer;
    margin: 0 auto;
    float: right;
}

</style>
<head>

</head>
<body>


<div class="modifybody">

<!-- sellerInfo -->

<form method="post" id="modifyForm" action="/myPage/modifyPro" enctype="multipart/form-data" onSubmit="return modifyPro();">
<input type="hidden" name="jmode" value="modify">
<input type="hidden" name="ckBtn">
<input type="hidden" name="receive" value="N">
<input type="hidden" name="auth_check">
<input type="hidden" name="memberNum" value="${memberDetail.memberNum}">

<div class="modifyMember">

<div id="subtitle" style="margin-bottom: 62px">
<p class="s_title">회원정보 수정</p>
</div>

<li class="1sp">
<div class="1sp">아이디(이메일)</div>
<div>${memberDetail.memberEmail}</div>
</li>

<li class="1sp">
<div>휴대전화 번호</div>
<div>
<ul class="left_ol">
<ol>${memberDetail.memberMobile}</ol>
<ol class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
전화번호 변경</ol>
</ul>
</div>
</li>

<li class="1sp">
<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
<dl class="fsize12 " style="margin-bottom: 10px"><i class="fa fa-exclamation-circle" style="margin:-3px 4px 0 0; font-size: 14px"></i>번호 인증 후에 저장 버튼을 누르셔야 변경됩니다.</dl>
<ol><input class="form-control" type="text" name="memberMobile" placeholder="휴대전화 번호"></ol>
<ol class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
인증</ol>

<li class="1sp">
<ol id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
<ol><input type="text" placeholder="인증번호 입력" class="form-control"></ol>
<ol class="accordion-button collapsed" type="button">확인</ol>
</ol>
</li>

</div>
<!-- 변경될 번호 입력 및 인증 번호 -->
<div class="clear"></div>
</li>


<li class="1sp">
<div>이름</div>
<div><input type="text" name="memberName" id="memberName" value="${memberDetail.memberName}" maxlength="8" class="form-control"></div>
</li>

<li class="1sp">
<div>우편번호</div>
<div>
<ol><input type="text" id="memberZipcode" name="memberZipcode" value="${memberDetail.memberZipcode}" class="form-control" readonly></ol>
<ol type="button" onclick="kakaoPost()">검색</ol>
</div>
</li>

<li class="1sp">
<div>주소</div>
<div><input type="text" id="memberAddress" name="memberAddress" value="${memberDetail.memberAddress}" class="form-control" readonly></div>
</li>

<li class="1sp">
<div>상세주소</div>
<div><input type="text" name="memberDetailAddress" value="${memberDetail.memberDetailAddress}" class="form-control"></div>
</li>

</div>
<!-- modifyMember -->

<div class="blank" style="height:70px;"></div>
<div class="left left_li" style="padding-left:4px">
<li style="margin-right: 30px" type="button" onclick="location.href='/myPage/modifyPassForm';">비밀번호 변경</li>
<li style="margin-right: 30px" type="button" onclick="location.href='/myPage/leaveForm';">회원탈퇴</li>
<c:set var="memberClass" value="${memberDetail.memberClass}"></c:set>
<c:if test="${memberDetail.memberClass != S}">
<input  style="margin-right: 30px" type="button" onclick="transSeller()" value="전문가 회원전환">
</c:if>
</div>

<input class="btn1 right"  type="submit" value="저 장">

</form>
</div>
<!-- body -->

</body>
<script>
function kakaoPost() {
	new daum.Postcode({
		oncomplete : function(data) {
			document.querySelector("#memberZipcode").value = data.zonecode;
			document.querySelector("#memberAddress").value = data.address
		}
	}).open();
}

function transSeller() {
	var form = document.getElementById("modifyForm");
	if (confirm("전문가 회원으로 전환 하시겠습니까?") == true) {
		form.action = "/myPage/transSeller";
		form.target = "_self";
		form.method = "post";
		form.submit();
		alert("전문가 회원으로 전환 되셨습니다.");
	} else {
		return false;
	}
}

function modifyPro() {
	//var form = document.getElementById("modifyForm");
	if (confirm("회원정보를 변경하시겠습니까?") == true) {
		alert("회원정보가 변경 되었습니다.");
		return true;
	} else {
		return false;
	} 
}
		

</script>
</html>