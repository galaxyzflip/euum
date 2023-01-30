<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<style>

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, form, fieldset, p, button {
    margin: 0;
	    padding: 0;
	  
}

div {
    display: block;
}

.modifyPassBody {
   	max-width: 980px;
    margin: 0 auto;
    list-style: none;
        
} 

.subContent {
    width: 1080px;
    margin: 0 auto;
    clear: both;
    padding-top: 56px;
    padding-bottom: 150px;
}


.s_title {
    font-size: 24px;
    letter-spacing: -1px;
}

.left_right_ul ul:nth-child(1) {
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
}

.btn3 {
    width: 188px;
    height: 58px;
    line-height: 58px;
    background: #818181;
    color: #fff;
    text-align: center;
    cursor: pointer;
    margin: 0 auto;
}



</style>
<body>

<div class="modifyPassBody">

<div id="subContent">

<p class="s_title">비밀번호 변경</p>
</div>

<div class="guide">
<ul>비밀번호는 8자리 이상으로 설정해주세요 (영문,숫자,특수문자 조합)</ul>
</div>

<form method="post" name="join">

<div>

<ul>
<ol>성명</ol>
<ol>${loginUser.memberName}</ol>
</ul>

<ul>
<ol>새로운 비밀번호</ol>
<ol><dl><input type="password" name="memberPassword" minlength="8" maxlength="16"></dl></ol>
</ul>

<ul>
<ol>비밀번호 확인</ol>
<ol><dl><input type="password" name="memberPassword_check" minlength="8" maxlength="16"></dl></ol>
</ul>

</div>

<div class="blank">&nbsp;</div>
<div class="left_right_ul" style="width:393px; margin:0 auto">
<input type="hidden" name="memberNum" value="${loginUser.memberNum}">
<input type="hidden" name="memberEmail" value="${loginUser.memberEmail}">
<input type="submit" class="btn1" onclick="return modifyPass();" value="비밀번호 변경">
<input type="submit" class="btn3" onclick="history.back();" value="이전 페이지"> 
</div>

</form>

</div>

</body>
<script>
function modifyPass() {
	if (confirm("비밀번호를 변경하시겠습니까?") == true) {
		alert("비밀번호가 변경 되었습니다.");
		return true;
	} else {
		return false;
	} 
}

function history.back() {
	return /myPage/modifyForm;
}
</script>
</html>