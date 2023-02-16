<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<style>

.modifyPassBody {
    width: 1080px;
    margin: 0 auto;
    clear: both;
    padding-top: 86px;
    padding-bottom: 86px;
}

.s_title {
    font-size: 24px;
    letter-spacing: -1px;
}

#passwd .guide {
    border: 1px solid #dadada;
    padding: 26px 48px;
    font-size: 13px;
}

#passwd .guide ul {
	margin-bottom: 0rem;
}

#passwd #pass_inp {
    border: 1px solid #dadada;
    padding: 31px 48px;
    margin-top: 40px;
}

#passwd #pass_inp ul {
    clear: both;
    height: 50px;
    margin-bottom: 0rem;
}

#passwd #pass_inp ul ol:nth-child(1) {
    width: 155px;
    line-height: 30px;
}

#passwd #pass_inp ul ol {
    float: left;
}

.left_right_ul ul:nth-child(1) {
    float: left;
}

.blank {
    clear: both;
    overflow: hidden;
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
<body>

<div class="modifyPassBody" id="passwd">

<div class="subContent">

<p class="s_title">비밀번호 변경</p>
</div>

<div class="guide">
<ul>비밀번호는 8자리 이상으로 설정해주세요 (영문,숫자,특수문자 조합)</ul>
</div>

<form method="post" name="join" action="/myPage/modifyPassPro" id="modifyPassForm">

<div id="pass_inp" class="cf">

<ul>
<ol>성명</ol>
<ol>${member.memberName}</ol>
</ul>

<ul>
<ol>새로운 비밀번호</ol>
<ol><dl><input type="password" name="memberPassword" id="memberPassword" minlength="8" maxlength="16"></dl></ol>
</ul>

<ul>
<ol>비밀번호 확인</ol>
<ol><dl><input type="password" name="memberPassword_check" id="memberPassword_check" minlength="8" maxlength="16"></dl></ol>
</ul>

</div>

<div class="blank" style="height:90px;">&nbsp;</div>
<div class="left_right_ul" style="width:393px; margin:0 auto">
<input type="hidden" name="memberNum" value="${member.memberNum}">
<input type="hidden" name="memberEmail" value="${member.memberEmail}">
</div>
<input type="submit" class="btn1" onclick="return modifyPass();" value="비밀번호 변경">

</form>

</div>

</body>
<script>
/* function modifyPass() {
	if (confirm("비밀번호를 변경하시겠습니까?") == true) {
		alert("비밀번호가 변경 되었습니다.");
		return true;
	} else {
		return false;
	} 
} */

function modifyPass(){

	 var pw1 = $("#memberPassword").val();
	 var num = pw1.search(/[0-9]/g);
	 var eng = pw1.search(/[a-z]/ig);
	 var spe = pw1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	 var pw2 = $("#memberPassword_check").val();

	 if(pw1.search(/\s/) != -1){

	  alert("비밀번호는 공백 없이 입력해주세요.");
	  return false;
	 }else if(pw1.length < 8 || pw1.length > 20){
	  alert("8자리 ~ 20자리 이내로 입력해주세요.");
	  return false;
	 }else if(num < 0 || eng < 0 || spe < 0 ){
	  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
	  return false;
	 }else if(pw2.length < 8 || pw2.length > 20){
	  alert("비밀번호 확인을 입력해주세요.");
	  return false;
	 }else if(pw1 != pw2){
	  alert("비밀번호가 일치하지 않습니다.");
	  return false;
	 }else {
		 alert("비밀번호가 변경 되었습니다.");
	    return true;
	 }

}

</script>
</html>