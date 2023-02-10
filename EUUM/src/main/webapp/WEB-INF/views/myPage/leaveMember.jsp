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

.leaveMemberBody {
   	max-width: 980px;
    margin: 0 auto;
    list-style: none;
        
} 

.s_title {
    font-size: 24px;
    letter-spacing: -1px;
}


.subContent {
    width: 1080px;
    margin: 0 auto;
    clear: both;
    padding-top: 56px;
    padding-bottom: 150px;
}

#memberQuit .guide {
    border: 1px solid #dadada;
    padding: 26px 48px;
    font-size: 13px;
}

#memberQuit .quit_inp {
    border: 1px solid #dadada;
    padding: 31px 48px;
    margin-top: 40px;
}

#memberQuit .quit_inp ul {
    clear: both;
    height: 50px;
}

#memberQuit .quit_inp ul ol {
    float: left;
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
}

</style>
<body>

<div class="leaveMemberBody">

<div class="subContent" id="memberQuit">
<p class="s_title">회원탈퇴 신청</p>
</div>

<div class="guide">
<div>주문하신 이력이 있는 경우, 주문 정보는 정책에 따라 일정기간 보존됩니다.</div>
<div>동일한 아이디로는 재가입하실 수 없습니다.</div>
</div>

<form method="post" name="join" action="/myPage/leavePro" id="leaveForm">

<div id="quit_inp" class="cf">

<ul>
<ol>성명</ol>
<ol>${member.memberName}</ol>
</ul>

<ul>
<ol>비밀번호</ol>
<ol><input type="password" name="memberPassword" maxlength="16"></ol>
</ul>

</div>

<div class="blank" style="height:90px;">&nbsp;</div>
<div class="left_right_ul" style="width:393px; margin:0 auto">
<input type="hidden" name="memberNum" value="${member.memberNum}">
<input type="hidden" name="sellerNum" value="${seller.sellerNum}">
<ul><input type="submit" class="btn1" onclick="leavePro();" value="회원 탈퇴"></ul>
<ul class="btn3" onclick="history.back();">이전 페이지</ul>
</div>

</form>

</div>
</body>
<script>
function leavePro() {
	if (confirm("정말 탈퇴 하시겠습니까?") == true) {
		alert("탈퇴 처리 되었습니다.");
		return true;
	} else {
		return false;
	} 
}
</script>
</html>