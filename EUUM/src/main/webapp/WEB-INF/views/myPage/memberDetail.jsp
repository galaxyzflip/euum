<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
.modifybody {
    width: 1080px;
    margin: 0 auto;
    clear: both;
    padding-top: 106px;
    padding-bottom: 150px;
}

#modify li div:nth-child(1) {
    width: 136px;
    line-height: 32px;
}

#modify li div {
    float: left;
    line-height: 2px;
}

.modifybody {
   	max-width: 980px;
    margin: 0 auto;
    list-style: none;
        
} 

#modifyForm input[type="text"] {
    width: 266px;
}

.s_title {
    font-size: 20px;
    letter-spacing: -1px;
    display: inline-block;
}


.lsp0 {
    letter-spacing: 0;
}

.fsize12 {
    font-size: 12px;
}

.rBtn_lGray {
    float: left;
    cursor: pointer;
    padding: 0 10px;
    height: 28px;
    text-align: center;
    line-height: 28px;
    border: 1px solid #dadada;
    background: #d7d7d7;
    font-size: 13px;
    margin: 0 auto;
    border-radius: 3px;
}

.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    transform: translate(0, 0);
}

.blank {
    clear: both;
    overflow: hidden;
}

.left_li li {
    float: left;
}

.left_ol ol {
    float: left;
}

.lsp0 {
    letter-spacing: 0;
}

.btn_auth {
    width: 80px;
    height: 32px;
    line-height: 32px;
    background: #eeeeee;
    border: 1px solid #dadada;
    border-left: 0;
    text-align: center;
    cursor: pointer;
    font-size: 14px;
    
}

.clear {
    clear: both;
    overflow: hidden;
}	

.cf:after {
    content: "";
    display: block;
    clear: both;
    visibility: hidden;
    width: 0;
    height: 0;
    font-size: 0;
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

#orgFile {
    display: none; 
}

</style>
<head>

</head>
<body>


<div class="modifybody">

<!-- sellerInfo -->

<form role="form" method="post" id="modifyForm" action="/myPage/modifyPro" enctype="multipart/form-data" onSubmit="return modifyPro();">
<input type="hidden" name="jmode" value="modify">
<input type="hidden" name="ckBtn">
<input type="hidden" name="receive" value="N">
<input type="hidden" name="auth_check">
<input type="hidden" name="memberNum" value="${memberDetail.memberNum}">

<div class="modify">

<div id="subtitle" style="margin-bottom: 62px">
<p class="s_title">회원정보 수정</p>
</div>

<li class="1sp">
<div class="1sp">아이디(이메일)</div>
<div>${memberDetail.memberEmail}</div>
</li>

<li class="1sp">
<div>휴대전화 번호</div>
<div class="left_ol cf">
<div class="lsp0" style="line-height: 32px; margin-right: 20px">${memberDetail.memberMobile}</div>
</div>
</li>

<div id="change_phone" class="cf">
<div>
<div class="left_ol cf">
<div class="fsize12 " style="margin-bottom: 10px">
<i class="fa fa-exclamation-circle" style="margin:-3px 4px 0 0; font-size: 14px"></i>번호 인증 후에 저장 버튼을 누르셔야 변경됩니다.</div>
<div><input type="text" name="memberMobile" id="memberMobile" placeholder="휴대전화 번호"></div>
<div class="btn_auth">인증</div>
</div>

<div id="atuhNum" style="margin-top: 10px;">
<div class="left_ol">
<div><input type="text" name="auth_num" id="auth_num" style="width:266px" placeholder="인증번호 입력"></div>
<div class="btn_auth">확인</div>
</div>
</div>
</div>

<!-- 변경될 번호 입력 및 인증 번호 -->
<div class="clear"></div>
</div>


<li style="height: 56px">
<div>이름</div>
<div><input type="text" name="memberName" id="memberName" value="${memberDetail.memberName}" maxlength="8"></div>
</li>

<li>
<div>우편번호</div>
<div><input type="text" id="memberZipcode" name="memberZipcode" value="${memberDetail.memberZipcode}" readonly>
<div type="button" onclick="kakaoPost()">검색</div>
</div>
</li>

<li>
<div>주소</div>
<div><input type="text" id="memberAddress" name="memberAddress" value="${memberDetail.memberAddress}" readonly></div>
</li>

<li>
<div>상세주소</div>
<div><input type="text" name="memberDetailAddress" value="${memberDetail.memberDetailAddress}"></div>
</li>

<!-- modifyMember -->

<div class="blank" style="height:70px;"></div>
<div class="left left_li" style="padding-left:4px">
<li style="margin-right: 30px" type="button" onclick="location.href='/myPage/modifyPassForm';">비밀번호 변경</li>
<li style="margin-right: 30px" type="button" onclick="location.href='/myPage/leaveForm';">회원탈퇴</li>
<c:set var="memberClass" value="${memberDetail.memberClass}"></c:set>
<c:if test="${memberDetail.memberClass != 'S'}">
<input type="button" class="real-Button" id="orgFile" onclick="submit2()" value="전문가 회원전환">
<li style="margin-right: 30px" class="Button" type="button" onclick="return submit2(this.form);">전문가 회원전환</li>
</c:if>
</div>

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

const realButton = document.querySelector('.real-Button');
const Button = document.querySelector('.Button');

function submit2(frm) {
	
	var frm = document.getElementById("modifyForm");
	
	if (confirm("전문가 회원으로 전환 하시겠습니까?") == true) {
		frm.action = '/myPage/transSeller';
		frm.target = "_self";
		frm.method = "post";
		frm.submit();
		alert("전문가 회원으로 전환 되셨습니다.");
	} else {
		return false;
	}
}

function modifyPro() {
	
	var name = $("#memberName").val();
	var ncheck = RegExp(/^[가-힣]+$/);
	
	if(name == ""){
	 alert("이름을 입력해주세요.");
	 $("#memberName").focus();
	 return false;
	} 
	if(!ncheck.test(name)) {
	 alert("이름형식에 맞게 입력해주세요.");
	 $("#memberName").val("");
	 $("#memberName").focus();
	 return false;
	}else {
		alert("회원정보가 변경 되었습니다.");
		return true;
	}
	
}
		
</script>
</html>