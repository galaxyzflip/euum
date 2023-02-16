<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<style>

.s_title {
    font-size: 24px;
    letter-spacing: -1px;
}


.leaveMemberBody {
    width: 1080px;
    margin: 0 auto;
    clear: both;
    padding-top: 86px;
    padding-bottom: 86px;
}

#memberQuit .guide {
    border: 1px solid #dadada;
    padding: 26px 48px;
    font-size: 13px;
}

#memberQuit #quit_inp {
    border: 1px solid #dadada;
    padding: 31px 48px;
    margin-top: 40px;
}

#memberQuit #quit_inp ul {
    clear: both;
    height: 50px;
    margin-bottom: 0rem;
}

#memberQuit #quit_inp ul ol {
    float: left;
}

#memberQuit #quit_inp ul ol:nth-child(1) {
    width: 155px;
    line-height: 30px;
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

<div class="leaveMemberBody" id="memberQuit">

<div class="subContent">
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
<ol><input type="password" name="memberPassword" id="memberPassword" maxlength="16"></ol>
</ul>

</div>

<div class="blank" style="height:90px;">&nbsp;</div>
<div class="left_right_ul" style="width:393px; margin:0 auto">
<input type="hidden" name="memberNum" value="${member.memberNum}">
<input type="hidden" name="sellerNum" value="${seller.sellerNum}">
<input type="hidden" name="memberPassword" value="${member.memberPassword}">
</div>
<input type="submit" class="btn1" onclick="return leavePro();" value="회원 탈퇴">

</form>

</div>
</body>
<script>
/* function leavePro() {
	if (confirm("정말 탈퇴 하시겠습니까?") == true) {
		alert("탈퇴 처리 되었습니다.");
		return true;
	} else {
		return false;
	} 
} */

function leavePro(){

	 var pw = $("#memberPassword").val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	 

	 if(pw.length < 1 || pw.length > 20){

	  alert("비밀번호를 입력해 주세요.");
	  return false;
	 }else if(pw != ${member.memberPassword}){
	  alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
	  return false;
	 }else {
		 alert("탈퇴 처리 되었습니다.");
	    return true;
	 }

}
</script>
</html>